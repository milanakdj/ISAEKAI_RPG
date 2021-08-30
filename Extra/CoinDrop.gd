extends KinematicBody2D

const ACCELERATION = 350
const MAX_SPEED = 200
var velocity = Vector2.ZERO
var spawn = Vector2.ZERO

var player = null
var being_picked_up = false
var coin_amount

func _ready():
	randomize()
	spawn = Vector2(int(rand_range(-100,100)),int(rand_range(100,-100)))
	
func _physics_process(delta):
	spawn = spawn.move_toward(Vector2.ZERO, 200*delta)
	spawn = move_and_slide(spawn)
	
	if being_picked_up == false:
		velocity = velocity.move_toward(Vector2(0,0), ACCELERATION * delta)
	else:
		var direction = global_position.direction_to(player.global_position)
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)

		var distance = global_position.distance_to(player.global_position)
		if distance < 4:
			queue_free()
			PlayerStats.coin += coin_amount
	velocity = move_and_slide(velocity)

func set_coin_amt(coin_amt):
	coin_amount = coin_amt

func pick_up_item(body):
	player = body
	being_picked_up = true
