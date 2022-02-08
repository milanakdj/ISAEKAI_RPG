extends Area2D

export(String, FILE) var target_scene
export(String, FILE) var current_scene
export(Vector2) var target_spawn_position

export(Vector2) var spawn_direction = Vector2(0,0)

func _on_hutDoor_body_entered(body):
	if !target_scene:
		print("No scene Found!")
		return
	
	Global.spawn_position = target_spawn_position
	$AnimationPlayer.play("opendoor")
	

func fade_animation():
	$AnimationPlayer.play("FadeToBlack")
	
	
func closeanimation():
	$AnimationPlayer.play("closedoor")

	
func changes_the_scene():
	
	if(get_tree().get_current_scene() == null):
		for nodes in get_tree().get_root().get_children():
			if(nodes.get_name() == current_scene):
				nodes.queue_free()
	get_tree().change_scene(target_scene)
