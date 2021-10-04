extends CanvasLayer


signal CloseMenu

export var currentScene = "Town"

onready var menu = $Control
onready var selectedarrow = $Control/TextureRect
onready var music = $Control/backMusic
onready var save_path = "user://save.dat"
enum ScreenLoaded { NOTHING, JUST_MENU, TUTORIAL}
var screenLoaded = ScreenLoaded.NOTHING

var selected_option: int = 0

func _ready():
	menu.visible = false 
	selectedarrow.rect_position.y = 64 + (selected_option % 4) * 20
	
func _unhandled_input(event):
	match screenLoaded:
		ScreenLoaded.NOTHING:
			if event.is_action_pressed("open_menu"):
				MusicController.play_stop()
				var player = get_tree().get_root().get_node(currentScene).find_node("YSort").find_node("Player")
				player.set_physics_process(false)
				get_tree().get_root().get_node(currentScene).find_node("MainCamera").set_process_input(false)
				menu.visible = true 
				$Control/backMusic.playing = true
				screenLoaded = ScreenLoaded.JUST_MENU
				
		ScreenLoaded.JUST_MENU:
			if event.is_action_pressed("open_menu") or event.is_action_pressed("x"):
				emit_signal("CloseMenu")
				screenLoaded = ScreenLoaded.NOTHING
				MusicController.play_music()
				var player = get_tree().get_root().get_node(currentScene).find_node("YSort").find_node("Player")
				player.set_physics_process(true)
				get_tree().get_root().get_node(currentScene).find_node("MainCamera").set_process_input(true)
			
			elif event.is_action_pressed("ui_down") or event.is_action_pressed("down"):
				selected_option +=1
				selectedarrow.rect_position.y = 64 + (selected_option % 4) * 20 
				
			elif event.is_action_pressed("ui_up") or event.is_action_pressed("up"):
				if selected_option == 0:
					selected_option = 3
				else :
					selected_option -=1
					selectedarrow.rect_position.y = 64 + (selected_option % 4) * 20
			
			elif event.is_action_pressed("ui_accept"):
				match selected_option:
					0:
						pass
					1:
						pass
					2:
						_on_Tutorial_pressed()
					3:
						screenLoaded = ScreenLoaded.NOTHING
						emit_signal("CloseMenu")
						MusicController.play_music()
						
		ScreenLoaded.TUTORIAL:
			if event.is_action_pressed("open_menu") or event.is_action_pressed("x"):
				menu.visible = false
				screenLoaded = ScreenLoaded.NOTHING
				

func _on_Exit():
	screenLoaded = ScreenLoaded.NOTHING
	emit_signal("CloseMenu")
	MusicController.play_music()

func _on_Tutorial_pressed():
	var tutorial_menu = load("res://mainmenu/TutorialMenu.tscn").instance()
	$Control.add_child(tutorial_menu)
	get_node("Control/TutorialMenu").connect("CloseTutorialMenu", self, "CloseTutorialMenus")
	
func CloseTutorialMenus():
	get_node("Control/TutorialMenu").queue_free()


func _on_Exit_pressed():
	emit_signal("CloseMenu")
	screenLoaded = ScreenLoaded.NOTHING
	MusicController.play_music()
	var player = get_tree().get_root().get_node(currentScene).find_node("YSort").find_node("Player")
	player.set_physics_process(true)
	get_tree().get_root().get_node(currentScene).find_node("MainCamera").set_process_input(true)


func _on_Save_Game_pressed():
	var player = get_tree().get_root().get_node(currentScene).find_node("YSort").find_node("Player")
	var data = {
		#"name": player.friction,
		"Player_location": player.position 
	}
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()


func _on_Load_Game_pressed():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			print(player_data)
