extends Control

var start = preload("res://Scene/level.tscn");

func _ready():
	$AnimationPlayer.play("fadeIn");

func _on_NewGame_pressed():
	$AnimationPlayer.play("fade");

func _on_press_play():
	get_tree().change_scene_to(start);

func _on_ExitGame_pressed():
	get_tree().quit(1);
