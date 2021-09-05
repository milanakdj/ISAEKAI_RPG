extends Area2D

export(String, FILE) var target_scene
export(Vector2) var target_spawn_position


func _on_hutDoor_body_entered(body):
	if !target_scene:
		print("No scene Found!")
		return
	Global.spawn_position = target_spawn_position
	$AnimationPlayer.play("opendoor")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene(target_scene)
	
func closeanimation():
	$AnimationPlayer.play("closedoor")
	
