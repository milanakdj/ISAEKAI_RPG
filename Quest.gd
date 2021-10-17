extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var death_count = 0
var valid_cells
var MainInstances = ResourceLoader.MainInstances

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_valid_cells() # Compute the valid cells in the tilemap
	var rand = RandomNumberGenerator.new()
	var enemyscene = load("res://Mobs/Bat.tscn")	
	#var cells_to_use = valid_cells.duplicate() # Copy the cells
	#cells_to_use.shuffle()  # Randomly shuffle them
	#var tilemap = get_tree().get_root().get_node("Town").find_node("Road")
	#var cell_size = tilemap.cell_size
	
	var screen_size = get_viewport().get_visible_rect().size
	var bat = YSort.new()
	bat.name = "bat"
	get_tree().get_root().get_node("Town").find_node("YSort").add_child(bat)
	var ysort = get_tree().get_root().get_node("Town").find_node("YSort")
	for i in range(0, 10):
		var enemy = enemyscene.instance()
		#enemy.set_position(cells_to_use.pop_front() * cell_size + cell_size/2.0)
		rand.randomize()
		var x = rand.randf_range(187, 357)
		rand.randomize()
		var y= rand.randf_range(-35, 153)
		enemy.position.y=y
		enemy.position.x=x
		get_tree().get_root().get_node("Town").find_node("YSort").get_child(ysort.get_child_count()-1).add_child(enemy)
		
		
	for i in get_tree().get_root().get_node("Town").find_node("YSort").get_child(ysort.get_child_count()-1).get_children():
		i.connect("death", self, "update_label")
	
	for i in get_tree().get_root().get_node("Town").find_node("Doors").get_children():
		i.get_node("CollisionShape2D").set_deferred("disabled", true)
	
	for i in get_tree().get_root().get_node("Town").find_node("NPC").get_children():
		i.quest_active = true
		
		
#func get_valid_cells() -> void:
#	valid_cells = []
#	var tilemap = get_tree().get_root().get_node("Town").find_node("Road")
#	for cell in tilemap.get_used_cells():
#		valid_cells.append(cell)

func update_label():
	death_count += 1
	$Quest_UI/Label.text = "Objective: " + String(death_count) + "of 10 completed"
	
	if death_count == 10:
		for i in get_tree().get_root().get_node("Town").find_node("Doors").get_children():
			i.get_node("CollisionShape2D").set_deferred("disabled", false)

		for i in get_tree().get_root().get_node("Town").find_node("NPC").get_children():
			i.quest_active  =  false
			
		var player =  MainInstances.player
		player.quest_one_finished = true
		self.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
