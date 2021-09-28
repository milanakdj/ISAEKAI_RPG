extends KinematicBody2D

onready var player = get_tree().get_root().get_node("Town").find_node("YSort").find_node("Player")

var speed = 100

func _physics_process(delta):
	look_at(player.global_position)
	move_and_slide(Vector2(0, speed).rotated(rotation))
