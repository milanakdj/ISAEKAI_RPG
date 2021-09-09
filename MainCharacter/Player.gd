extends KinematicBody2D

export var FRICTION = 500
export var ACCELERATION = 350
export var MAX_SPEED = 50

const sword_texture = preload("res://Assets/pngwing.com (2).png")
const thor_texture = preload("res://Assets/thor.png")

var velocity = Vector2.ZERO

enum {
	MOVE,
	ATTACK
}

var state = MOVE
var can_move = true

onready var animationPlayer = $AnimationPlayer 
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var sprite = $Character
onready var hitBox = $Gizmo/HitBox
onready var hurtBox = $HurtBox
onready var collisionHitbox = $Gizmo/HitBox/CollisionShape2D
onready var PlayerUI = $UI/PlayerHud
onready var shadow = $Shadow

func _ready():
	randomize()
	sprite.visible = true
	animationTree.active = true
	if Global.player_current_location:
		global_position = Global.player_current_location
	if Global.spawn_position:
		global_position = Global.spawn_position
	var weapon = sprite.texture.resource_path
	collisionHitbox.disabled = true
	$sword.visible = false
	$glasses.visible = false
	



func _physics_process(delta):
	if can_move:
		match state:
			MOVE:
				move_state(delta)
			ATTACK:
				attack_state()
	
	if $PickupZone.items_in_range.size() > 0:
		var pickup_item = $PickupZone.items_in_range.values()[0]
		pickup_item.pick_up_item(self)
		$PickupZone.items_in_range.erase(pickup_item)

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized() 
	
	if input_vector != Vector2.ZERO:
		hitBox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Walk/blend_position", input_vector)
		animationTree.set("parameters/AttackOneHand/blend_position", input_vector)
		animationState.travel("Walk")
		if Input.is_action_pressed("run"):
			ACCELERATION = 5000#500
			MAX_SPEED = 8000#80
		else:
			ACCELERATION = 300#300
			MAX_SPEED = 50#50
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move()
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
		hitBox.damage = 5
		

func move():
	velocity = move_and_slide(velocity)

func attack_state():
	velocity = Vector2.ZERO
	animationState.travel("AttackOneHand")

func on_attack_animation_finished():
	state = MOVE

func _on_HurtBox_area_entered(area):
	PlayerStats.health -= area.damage
	PlayerUI.on_health_updated(PlayerStats.health)
	hurtBox.start_invincibility(0.6)
	hurtBox.create_hit_effect()

func _on_HurtBox_invincibility_ended():
	animationPlayer.play("BlinkStop")

func _on_HurtBox_invincibility_started():
	animationPlayer.play("BlinkStart")

func load_texture(name):
	return load("res://Assets/Items/" + name + ".png")


func _on_HutDoorZone_area_entered(area):
	sprite.visible = false
	shadow.visible = false
	$glasses.visible = false

func _unhandled_input(event):
	if event.is_action_pressed("sword_equip"):
		$sword.texture = sword_texture
		$sword.scale = Vector2(.02,.02)
		$sword.visible = true
	elif event.is_action_pressed("equip_thor"):
		$sword.texture = thor_texture
		$sword.scale = Vector2(.02,.02)
		$sword.visible = true



func _on_hutDoor3_body_entered(body):
	sprite.visible = false
	shadow.visible = false
	$glasses.visible = false
