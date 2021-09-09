extends Node2D

onready var menu = $Menu/Control


func _ready():
	menu.visible = false
	if Global.spawn_position:
		$YSort/Player.global_position = Global.spawn_position

func _input(event):
	if event.is_action_pressed("open_menu"):
		$Menu/Control.visible = true
		$Menu/Control/backMusic.playing = true
		

func _on_Exit_pressed():
	$Menu/Control.visible = false
	$Menu/Control/backMusic.playing = false
