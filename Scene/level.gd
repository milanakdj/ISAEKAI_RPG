extends Node2D

var cursor = load("res://cursor.png")

func _ready():
	if MusicController.playing == false:
		MusicController.play_music()     	
	Global.next_scene= "res://Scene/Town.tscn"
	$YSort/Skeleton.visible = false
	$YSort/Bat.visible = false
	$YSort/Bat2.visible = false
	if Global.spawn_position:
		$YSort/Player.global_position = Global.spawn_position
		get_tree().get_root().get_node("level").find_node("YSort").find_node("Cat").position = Global.spawn_position 
	Input.set_custom_mouse_cursor(cursor)
	$CanvasLayer/DialogBox.connect("done",self,"_on_done")
	if Global.new_game:
		$YSort/Player.visible = false
		$YSort/Player.can_move = false
		$YSort/Player.find_node("PlayerHud").visible = false
		$AnimationPlayer.play("fadeOut")
	else:
		$PlayerSprite.queue_free()
	$Menu.connect("CloseMenu", self, "_on_Exit")	
	loading_screen_load()
	
func _fade_complete():
	$AnimationPlayer.play("playerWake")

func _wake_complete():
	$PlayerSprite.queue_free()
	$YSort/Player.visible = true
	$CanvasLayer/DialogBox._load_dialogs()
	
func _on_done():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	UserInterface.game_load()
	$YSort/Player.can_move = true
	$YSort/Player.find_node("PlayerHud").visible = true
	Global.new_game = false
	
	
	
func _input(event):
	if event.is_action_pressed("open_menu") and $Menu/Control.visible == false:
		$Menu/Control.visible = true
		$Menu/Control/backMusic.playing = true
		#$Menu._unhandled_input(event)
	elif event.is_action_pressed("open_menu") and $Menu/Control.visible == true:
		pass

func _on_Exit():
	$Menu/Control.visible = false
	$Menu/Control/backMusic.playing = false




func _on_first_scene_body_entered(body):
	print('hallow')
	if body.name.begins_with("Player"):
		$YSort/Skeleton.visible = true
		$YSort/Skeleton/AnimationPlayer.play("WalkDown (follow)")
	


func _on_first_scene2_body_entered(body):
	if body.name.begins_with("Player"):
		$YSort/Bat.visible = true
		


func _on_first_scene3_body_entered(body):
	if body.name.begins_with("Player"):
		$YSort/Bat2.visible = true



func loading_screen_load():
	if Global.loading_screen_load:
		SaverAndLoader.load_game()
		Global.loading_screen_load = false
