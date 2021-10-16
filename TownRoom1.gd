extends Node2D

func _ready():
	$Menu.connect("CloseMenu", self, "_on_Exit")	
	loading_screen_load()

func _on_Exit():
	$Menu/Control.visible = false
	$Menu/Control/backMusic.playing = false


func loading_screen_load():
	if Global.loading_screen_load:
		SaverAndLoader.load_game()
		Global.loading_screen_load = false
