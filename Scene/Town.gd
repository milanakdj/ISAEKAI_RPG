extends Node2D

onready var menu = $Menu/Control
onready var top_menu = $Menu
var MainInstances = ResourceLoader.MainInstances
func _ready():
	MusicController.play_music()
	Global.next_scene= "res://Scene/level.tscn"
	menu.visible = false
	
	if Global.spawn_position:
		$YSort/Player.global_position = Global.spawn_position
	
	$Menu.connect("CloseMenu", self, "_on_Exit")	
	loading_screen_load()
	
func _input(event):
	pass
func _on_Exit():
	menu.visible = false
	$Menu/Control/backMusic.playing = false

func loading_screen_load():
	if Global.loading_screen_load:
		SaverAndLoader.load_game()
		Global.loading_screen_load = false
