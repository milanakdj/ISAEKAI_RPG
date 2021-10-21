extends Node2D

var battle_music = load("res://resources/Fight.ogg")
var playing = false
func _ready():
	pass # Replace with function body.

func play_music():
	playing = true
	print("YESSSSSSSSSSSSS")
	$Music.stream = battle_music
	$Music.play()
func play_stop():
	playing = false
	$Music.stop()
