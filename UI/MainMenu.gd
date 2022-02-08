extends Control

var start = preload("res://Main.tscn");
var MainInstances = ResourceLoader.MainInstances

func _ready():
	$AnimationPlayer.play("fadeIn");

func _on_NewGame_pressed():
	$AnimationPlayer.play("fade");

func _on_press_play():
	get_tree().change_scene_to(start);

func _on_ExitGame_pressed():
	get_tree().quit(1);


func _on_LoadGame_pressed():
	
	Global.loading_screen_load = true
	var new_load
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return 
	save_game.open("user://savegame.save", File.READ)
	var current_line = parse_json(save_game.get_line())# returns a dictionary
	if current_line != null:
		new_load = (current_line["parent'sparent"])
		if new_load == "":
			new_load = (current_line["parent_filename"])
		print(new_load)
	save_game.close()
	var newinstance = load(new_load).instance()
	#var newNode = load(current_line["filename"]).instance()
	get_tree().get_root().add_child(newinstance, true)
	#get_tree().change_scene_to(new_load);
	self.queue_free()
	
