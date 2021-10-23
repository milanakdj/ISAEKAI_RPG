extends Control

signal CloseGoalsMenu

var button_load = preload("res://Button1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	#$NinePatchRect/ScrollContainer/VBoxContainer/Button1/Label.text = "whatsss up"
	var i=0
	var my_dict= PoolStringArray()
	var current_line = {}
	#var button ="$NinePatchRect/ScrollContainer/VBoxContainer/Button"+String(i)+"/Label"
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return 
	save_game.open("user://savegame.save", File.READ)
	while not save_game.eof_reached():
		current_line = parse_json(save_game.get_line())# returns a dictionary
		if current_line != null:
			my_dict.push_back(current_line["filename"])
			i=i+1
	var j =i
	while j!=0:		
		$NinePatchRect/ScrollContainer/VBoxContainer.add_child(button_load.instance())
		j=j-1
	i=i-1
	for buttons in $NinePatchRect/ScrollContainer/VBoxContainer.get_children():
		if i != -1:
			buttons.get_child(0).text = my_dict[i]
			print(my_dict[i])
			i=i-1
	save_game.close()
		
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ExitGame_pressed():
	emit_signal("CloseGoalsMenu")
