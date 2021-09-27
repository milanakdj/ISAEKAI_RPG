extends Area2D

export(String, FILE) var target_scene
export(String, FILE) var current_scene
export(Vector2) var target_spawn_position = Vector2(2065, 323)

func _on_Door_body_entered(body):
	if !target_scene:
		print("No scene Found!")
		return
	Global.spawn_position = target_spawn_position
	$AnimationPlayer.play("fade")
	SceneChanger.goto_scene(target_scene, current_scene)

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene(target_scene)
	
