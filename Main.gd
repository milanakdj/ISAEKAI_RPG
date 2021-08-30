extends Node

export(String, FILE) var current_scene

func _ready():
	if not Global.new_game:
		UserInterface.game_load();
	get_tree().change_scene(current_scene)
