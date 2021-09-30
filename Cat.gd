extends KinematicBody2D

const DEFAULT_MASS : = 2.0
const DEFAULT_MAX_SPEED : = 20.0

onready var player = get_tree().get_root().get_node("Town").find_node("YSort").find_node("Player")

onready var sprite = $AnimatedSprite

var speed = 100
var velocity= Vector2.ZERO

func _physics_process(delta):
	var target_global_position: Vector2 = player.global_position
	#look_at(player.global_position)
	if (global_position.distance_to(target_global_position) <3.0):
		return
	velocity = follow(velocity, global_position, target_global_position)
	velocity = move_and_slide(velocity)
	sprite.rotation = velocity.angle()
	
static func follow(
	velocity :Vector2,
	global_position :Vector2,
	target_position :Vector2,
	max_speed: = DEFAULT_MAX_SPEED,
	mass : = DEFAULT_MASS
) -> Vector2: 
	var desired_velocity = (target_position - global_position).normalized() * max_speed
	var steering = (desired_velocity - velocity) / mass 
	var new_velocity = Vector2.ZERO
	return velocity + steering
