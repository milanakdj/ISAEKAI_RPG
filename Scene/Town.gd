extends Node2D

func _ready():
	if Global.spawn_position:
		$YSort/Player.global_position = Global.spawn_position
