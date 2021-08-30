extends Node2D

var cursor = load("res://cursor.png")

func _ready():
	if Global.spawn_position:
		$YSort/Player.global_position = Global.spawn_position
	Input.set_custom_mouse_cursor(cursor)
	$CanvasLayer/DialogBox.connect("done",self,"_on_done")
	if Global.new_game:
		$YSort/Player.visible = false
		$YSort/Player.can_move = false
		$YSort/Player.find_node("PlayerHud").visible = false
		$AnimationPlayer.play("fadeOut")
	else:
		$PlayerSprite.queue_free()

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
	
	
	
	
