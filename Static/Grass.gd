extends Node2D

var GrassEffect = preload("res://Effects/GrassEffect.tscn")

func createEffect():
	var grassEffect = GrassEffect.instance()
	get_parent().add_child(grassEffect)
	grassEffect.global_position = global_position

func _on_HurtBox_area_entered(_area):
	createEffect()
	queue_free()

func _on_stepArea_body_entered(_body):
	$AnimationPlayer.play("step")


func _on_stepArea_body_exited(_body):
	$AnimationPlayer.play("ready")
