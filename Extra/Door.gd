extends Area2D

export(String, FILE) var target_scene
export(String, FILE) var current_scene
export(Vector2) var target_spawn_position = Vector2(2065, 323)
var loadingBar = preload("res://LoadingBar.tscn")

func _on_Door_body_entered(body):
	if !target_scene:
		print("No scene Found!")
		return
	Global.spawn_position = target_spawn_position
	$AnimationPlayer.play("fade")
	#SceneChanger.goto_scene(target_scene, current_scene)

func _on_AnimationPlayer_animation_finished(anim_name):
	#loadingBar.instance().next_scene= "res://Scene/level.tscn"
	#get_tree().get_root().add_child(loadingBar.new())
	#get_tree().get_root().find_node("Town").queue_free()
	
	get_tree().change_scene("res://LoadingBar.tscn")
	
