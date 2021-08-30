extends KinematicBody2D

var knockback = Vector2.ZERO
var velocity = Vector2.ZERO
const MAX_SPEED = 50
const ACCELERATION = 300

enum {
	IDLE,
	WANDER,
	ATTACK
}

var state = IDLE

onready var playerDetection = $PlayerDetection
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

var direction = Vector2.ZERO

func _physics_process(delta):		
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)
	
	animationTree.set("parameters/Attack/blend_position", direction)
	animationTree.set("parameters/Idle/blend_position", direction)
	animationTree.set("parameters/Walk/blend_position", direction)
	
	match state:
		IDLE:
			animationState.travel("Idle")
			search_for_player()
		WANDER:
			animationState.travel("Walk")
		ATTACK:
			var player = playerDetection.player
			if player != null:
				animationState.travel("Attack")
			else:
				state = IDLE
	velocity = move_and_slide(velocity)
	
func search_for_player():
	if playerDetection.can_see_player():
		state = ATTACK

func _on_HurtBox_area_entered(area):
	knockback = area.knockback_vector * 100
	
func on_attack_animation_finished():
	state = IDLE
	
