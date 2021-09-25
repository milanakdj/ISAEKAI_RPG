extends KinematicBody2D

const FORCE = 120
const MAX_SPEED = 40
const ACCELERATION = 200

var knockback = Vector2.ZERO
var DeathEffect = preload("res://Effects/Explode.tscn")
var expDrops = preload("res://Extra/ExpDrops.tscn")
var coinDrops = preload("res://Extra/CoinDrop.tscn")

export(float) var MAX_HEALTH = 100
export(int) var damage = 5

enum {
	IDLE,
	WANDER,
	CHASE
}
var state = IDLE

onready var WandererController = $WandererController
onready var PlayerDetection = $PlayerDetection
onready var sprite = $BatSprite
onready var SoftCollision = $SoftCollision
onready var Stats = $Stats
onready var health_bar = $HealthBar
onready var hitBox = $HitBox
onready var hurtBox = $HurtBox
onready var animationPlayer = $AnimationPlayer

var velocity = Vector2.ZERO

func _ready():
	Stats.MAX_HEALTH = MAX_HEALTH
	hitBox.damage = damage
	wandering_state()
	health_bar.visible = false
	
	

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200*delta)
	knockback = move_and_slide(knockback)

	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, 200*delta)
			search_for_player()
			if WandererController.get_time_left() == 0:
				wandering_state()
		WANDER:
			search_for_player()
			if WandererController.get_time_left() == 0:
				wandering_state()
			accelerate_towards_point(WandererController.target_position, delta)
			if global_position.distance_to(WandererController.target_position) <= MAX_SPEED * delta:
				wandering_state()
		CHASE:
			var player = PlayerDetection.player
			if player != null:
				accelerate_towards_point(player.global_position,delta)
			else:
				state = IDLE
	if SoftCollision.is_colliding():
		velocity += SoftCollision.get_push_vector() * delta * 400
	velocity = move_and_slide(velocity)

func accelerate_towards_point(pos, delta):
	var direction = global_position.direction_to(pos)
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x < 0

func search_for_player():
	if PlayerDetection.can_see_player():
		state = CHASE

func wandering_state():
	state = pick_random_state([IDLE,WANDER])
	WandererController.start_wander_timer(rand_range(1,3))

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()

func _on_HurtBox_area_entered(area):
	knockback = area.knockback_vector * FORCE
	Stats.health -= area.damage
	hurtBox.create_hit_effect()
	hurtBox.start_invincibility(0.3)
	health_bar._on_health_updated(Stats.health)

func _on_Stats_no_health():
	var effect = DeathEffect.instance()
	get_parent().add_child(effect)
	effect.global_position = global_position
	queue_free()
	drop_exp()
	drop_coin()

func _on_PlayerDetection_entered():
	health_bar.visible = true
		
func _on_PlayerDetection_exited():
	health_bar.visible = false

func _on_HurtBox_invincibility_ended():
	animationPlayer.play("Stop")

func _on_HurtBox_invincibility_started():
	animationPlayer.play("Blink")

func drop_exp():
	randomize()
	var drops_chance = randi() % 3 + 1
	for i in drops_chance:
		var exp_drop = expDrops.instance()
		exp_drop.set_exp_amt(5)
		get_tree().current_scene.add_child(exp_drop)
		exp_drop.global_position = global_position

func drop_coin():
	randomize()
	var drops_chance = randi() % 3 + 1
	for i in drops_chance:
		var coin_drops = coinDrops.instance()
		randomize()
		coin_drops.set_coin_amt(randi() % 3 + 1)
		get_tree().current_scene.add_child(coin_drops)
		coin_drops.global_position = global_position
