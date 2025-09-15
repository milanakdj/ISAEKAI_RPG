extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func goto_scene(path, current_scene):
	var loader = ResourceLoader.load_interactive(path)
	
	var loadingbar = load("res://ProgressBar.tscn").instance()
	
	get_tree().get_root().call_deferred('add_child', loadingbar)
	
	
	while true:
		var err = loader.poll()
		if err == ERR_FILE_EOF:
			var resource = loader.get_resource()
			get_tree().get_root().call_deferred('add_child', resource.instance())
			current_scene.instance().queue_free()
			loadingbar.queue_free()
			break
		if err == OK:
			var progress = float(loader.get_stage())/ loader.get_stage_count()
			loadingbar.value = progress * 100
			print(progress)	
		yield(get_tree(), "idle_frame")
