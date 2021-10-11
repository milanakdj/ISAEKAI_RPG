extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var death_count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var rand = RandomNumberGenerator.new()
	var enemyscene = load("res://Mobs/Bat.tscn")	
	
	var screen_size = get_viewport().get_visible_rect().size
	var bat = YSort.new()
	bat.name = "bat"
	get_tree().get_root().get_node("Town").find_node("YSort").add_child(bat)
	var ysort = get_tree().get_root().get_node("Town").find_node("YSort")
	for i in range(0, 10):
		var enemy = enemyscene.instance()
		rand.randomize()
		var x = rand.randf_range(0, screen_size.x)
		rand.randomize()
		var y= rand.randf_range(0, screen_size.y)
		enemy.position.y=y
		enemy.position.x=x
		get_tree().get_root().get_node("Town").find_node("YSort").get_child(ysort.get_child_count()-1).add_child(enemy)
		
		
	for i in get_tree().get_root().get_node("Town").find_node("YSort").get_child(ysort.get_child_count()-1).get_children():
		i.connect("death", self, "update_label")
	
	for i in get_tree().get_root().get_node("Town").find_node("Door2").get_children():
		i.get_node("CollisionShape2D").disabled = true
	
	for i in get_tree().get_root().get_node("Town").find_node("NPC").get_children():
		i.quest_active = true
		
func update_label():
	death_count += 1
	$Quest_UI/Label.text = "Objective: " + String(death_count) + "of 10 completed"
	
	if death_count == 10:
		for i in get_tree().get_root().get_node("Town").find_node("Door2").get_children():
			i.get_node("CollisionShape2D").disabled = false
		for i in get_tree().get_root().get_node("Town").find_node("NPC").get_children():
			i.quest_active  =  false
		self.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
