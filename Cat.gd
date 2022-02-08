extends KinematicBody2D

const DEFAULT_MASS : = 2.0
const DEFAULT_MAX_SPEED : = 25.0

var MainInstances = ResourceLoader.MainInstances

onready var sprite = $Sprite
onready var animationplayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
enum {
	MOVE,
	IDLE
}
var speed = 100
var velocity= Vector2.ZERO
var can_move = true
var state = IDLE
var target_global_position: Vector2
var player

func _ready():
	player = MainInstances.player
	
func _physics_process(delta):
	call_deferred("player_position")
	
	if can_move:
		match state:
			MOVE:
				move_state(delta, target_global_position)
			IDLE:
				animationState.travel("Idle")
				if (is_instance_valid(player)):
					if(player.animationState.get_current_node() != "Idle"):
						state = MOVE
	#look_at(player.global_position)
	if Input.is_action_just_pressed("save"):
		SaverAndLoader.save_game()
	
	if Input.is_action_just_pressed("loads"):
		SaverAndLoader.load_game()

func save():
	var player =  MainInstances.player
	var save_dictionary = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"position_x": position.x,
		"position_y": position.y
	}
	return save_dictionary
	
func player_position():
#	var player =  MainInstances.player
	target_global_position = player.global_position
	

func move_state(delta, target_global_position):
#	var player =  MainInstances.player
	var input_vector = Vector2.ZERO
	input_vector.x = target_global_position.x - global_position.x
	input_vector.y = target_global_position.y - global_position.y
	input_vector = input_vector.normalized() 
	
	
	if(player.animationState.get_current_node() == "Idle"):
		state = IDLE
		animationState.travel("Idle")
		
	if input_vector != Vector2.ZERO:
		#animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Walk/blend_position", input_vector)
		animationTree.set("parameters/AttackOneHand/blend_position", input_vector)
		animationState.travel("Walk")
		if (global_position.distance_to(target_global_position) <20.0):
			return
		velocity = follow(velocity, global_position, target_global_position)
		velocity = move_and_slide(velocity)
		#sprite.rotation = velocity.angle()
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, 500 * delta)
	move()

func move():
	velocity = move_and_slide(velocity)

		
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
