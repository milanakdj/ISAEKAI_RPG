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
var active = false

onready var playerDetection = $PlayerDetection
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")


var direction = Vector2.ZERO

func _ready():
	playerDetection.connect("entered", self, "on_NPC_body_entered")
	playerDetection.connect("exited", self, "on_NPC_body_exited")

func on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true		
	
func on_NPC_body_exited(body):
	print("hello")
	if body.name == 'Player':
		active = false 
		
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed('ui_accept') and active:
			get_tree().paused = true
			var dialog = Dialogic.start('timeline-1')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)

func unpause(timeline_name):
	get_tree().paused = false
	
	
	
func _physics_process(delta):		
	$Sprite.visible = active 
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
	

	
