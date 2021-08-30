extends Node

var item_data : Dictionary
var loot_items: Dictionary

func _ready():
	item_data = loadData("res://Data/items.json")
	loot_items = loadData("res://Data/loot.json")
	
func loadData(file_path):
	var json_data
	var file_data = File.new()
	
	file_data.open(file_path, File.READ)
	json_data = JSON.parse(file_data.get_as_text())
	file_data.close()
	return json_data.result


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
