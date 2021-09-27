extends Node2D

onready var menu = $Menu/Control
onready var top_menu = $Menu

func _ready():
	Global.next_scene= "res://Scene/level.tscn"
	menu.visible = false
	
	if Global.spawn_position:
		$YSort/Player.global_position = Global.spawn_position
	
	$Menu.connect("CloseMenu", self, "_on_Exit")	
	
	
func _input(event):
	pass
func _on_Exit():
	menu.visible = false
	$Menu/Control/backMusic.playing = false

