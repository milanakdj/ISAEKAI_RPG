extends KinematicBody2D


const FORCE = 120
const MAX_SPEED = 40
const ACCELERATION = 200


onready var WandererController = $WandererController
onready var sprite = $AnimatedSprite

var velocity = Vector2.ZERO


enum {
	IDLE,
	WANDER
}
var state = IDLE

func _ready():
	wandering_state()
	sprite.frame = rand_range(1,118)

func _physics_process(delta):
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, 200*delta)
			if WandererController.get_time_left() == 0:
				wandering_state()
		WANDER:
			if WandererController.get_time_left() == 0:
				wandering_state()
			accelerate_towards_point(WandererController.target_position, delta)
			if global_position.distance_to(WandererController.target_position) <= MAX_SPEED * delta:
				wandering_state()
	velocity = move_and_slide(velocity)

func accelerate_towards_point(pos, delta):
	var direction = global_position.direction_to(pos)
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x < 0

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()


func wandering_state():
	state = pick_random_state([IDLE,WANDER])
	WandererController.start_wander_timer(rand_range(1,3))
