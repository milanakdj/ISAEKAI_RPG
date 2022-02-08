extends Node2D

var current_map : String
var loot_count
var loot_item = {}

onready var slots = $ScrollContainer/VBoxContainer.get_children()

func _ready():
	current_map = "Town"
	for i in range(slots.size()):
		slots[i].connect("loot_pressed", self, "on_loot_pressed")
	determine_loot_count()
	loot_selector()
	populate_panel()
	
func determine_loot_count():
	var count_min = JsonData.loot_items[current_map].min_loot
	var count_max = JsonData.loot_items[current_map].max_loot
	randomize()
	loot_count = randi() % ((int(count_min) - int(count_max)) + 1) + int(count_min)
	
func loot_selector():
	for i in range(1, loot_count+1):
		var lootSelector = randi() % 100 + 1
		var counter = 1
		while lootSelector >= 0:
			if lootSelector <= JsonData.loot_items[current_map]["item"+str(counter)+"chance"]:
				var loot = []
				loot.append(JsonData.loot_items[current_map]["item"+str(counter)+"name"])
				randomize()
				loot.append(int(rand_range(float(JsonData.loot_items[current_map]["item"+str(counter)+"min_count"]),float(JsonData.loot_items[current_map]["item"+str(counter)+"max_count"]))))
				loot_item[loot_item.size()] = loot
				break
			else:
				lootSelector -= JsonData.loot_items[current_map]["item"+str(counter)+"chance"]
				counter += 1
	
func populate_panel():
	var counter = 0
	for i in slots:
		if counter <= loot_item.size() - 1:
			get_node(str(i.get_path())+"/ItemName").set_text(JsonData.item_data[loot_item[counter][0]].name)
			get_node(str(i.get_path())+"/ItemSlot/TextureButton").set_normal_texture(load_texture(JsonData.item_data[loot_item[counter][0]].texture))
			if loot_item[counter][0] != "coin":
				get_node(str(i.get_path())+"/ItemSlot/TextureButton").set_scale(Vector2(0.5,0.5))
			get_node(str(i.get_path())+"/ItemSlot/ItemAmount").set_text(str(loot_item[counter][1]))
			counter += 1
		else:
			i.queue_free()

func load_texture(name):
	return load("res://Assets/Items/" + name + ".png")

func on_loot_pressed(value):
	if loot_item[value][0] == "coin":
		PlayerStats.coin += loot_item[value][1]
	else:
		PlayerInventory.add_item(loot_item[value][0], loot_item[value][1])
	loot_item.erase(value)

func _on_close_button_down():
	visible = false

func _on_lootAll_button_down():
	for i in range(loot_item.size()):
		if loot_item[i][0] == "coin":
			PlayerStats.coin += loot_item[i][1]
		else:
			PlayerInventory.add_item(loot_item[i][0], loot_item[i][1])
		loot_item.erase(i)
		slots[i].queue_free()

func _unhandled_input(event):
	if event.is_action_pressed("escape"):
		visible = false
