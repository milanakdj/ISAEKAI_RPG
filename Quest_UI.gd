extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var objective_counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var rand = RandomNumberGenerator.new()
	var enemyscene = load("res://Mobs/Bat.tscn")	
	
	var screen_size = get_viewport().get_visible_rect().size
	
	for i in range(0, 10):
		var enemy = enemyscene.instance()
		rand.randomize()
		var x = rand.randf_range(0, screen_size.x)
		rand.randomize()
		var y= rand.randf_range(0, screen_size.y)
		enemy.position.y=y
		enemy.position.x=x
		get_tree().get_root().get_node("Town").find_node("YSort").add_child(enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
