extends CanvasLayer


signal CloseMenu

export var currentScene = "Town"

onready var menu = $Control
onready var selectedarrow = $Control/TextureRect

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
				#var player = find_parent(currentScene).get_children().back().find_node("Player")
				var player = get_tree().get_root().get_node(currentScene).find_node("YSort").find_node("Player")
				player.set_physics_process(false)
					
				menu.visible = true 
				screenLoaded = ScreenLoaded.JUST_MENU
				
		ScreenLoaded.JUST_MENU:
			if event.is_action_pressed("open_menu") or event.is_action_pressed("x"):
				menu.visible = false
				screenLoaded = ScreenLoaded.NOTHING
				var player = get_tree().get_root().get_node(currentScene).find_node("YSort").find_node("Player")
				player.set_physics_process(true)
			
			elif event.is_action_pressed("ui_down") or event.is_action_pressed("down"):
				selected_option +=1
				selectedarrow.rect_position.y = 64 + (selected_option % 4) * 20
				 
				
			elif event.is_action_pressed("ui_up") or event.is_action_pressed("up"):
				if selected_option == 0:
					selected_option = 3
				else :
					selected_option -=1
					selectedarrow.rect_position.y = 64 + (selected_option % 4) * 20
				
		ScreenLoaded.TUTORIAL:
			if event.is_action_pressed("open_menu") or event.is_action_pressed("x"):
				menu.visible = false
				screenLoaded = ScreenLoaded.NOTHING
				

func _on_Exit_pressed():
	emit_signal("CloseMenu")
