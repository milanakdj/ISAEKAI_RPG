extends Node2D

var battle_music = load("res://resources/Fight.ogg")
func _ready():
	pass # Replace with function body.

func play_music():
	$Music.stream = battle_music
	$Music.play()
