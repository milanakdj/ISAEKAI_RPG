extends Node2D

onready var menu = $Menu/Control
onready var top_menu = $Menu

func _ready():
	menu.visible = false
	
	if Global.spawn_position:
		$YSort/Player.global_position = Global.spawn_position
	
	$Menu.connect("CloseMenu", self, "_on_Exit")	
	
	
func _input(event):
	if event.is_action_pressed("open_menu") and $Menu/Control.visible == false:
		$Menu/Control.visible = true
		$Menu/Control/backMusic.playing = true
		#$Menu._unhandled_input(event)
	elif event.is_action_pressed("open_menu") and $Menu/Control.visible == true:
		pass
func _on_Exit():
	menu.visible = false
	$Menu/Control/backMusic.playing = false
