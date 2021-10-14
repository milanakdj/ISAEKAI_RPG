extends KinematicBody2D


const FORCE = 120
const MAX_SPEED = 40
const ACCELERATION = 200

var quest = preload("res://Quest.tscn")
onready var WandererController = $WandererController
onready var playerDetection = $PlayerDetection

onready var sprite = $Character
var MainInstances = ResourceLoader.MainInstances
var velocity = Vector2.ZERO
enum {
	IDLE,
	WANDER,
	INTERACT
}

var state = IDLE
var active = false
export var quest_active = false

func _ready():
	wandering_state()
	$Character.frame = rand_range(1,118)
	playerDetection.connect("entered", self, "on_NPC_body_entered")
	playerDetection.connect("exited", self, "on_NPC_body_exited")


func on_NPC_body_entered(body):
	if body.get_filename() == MainInstances.player.get_filename() and not quest_active:
		$Sprite.visible= true
		active = true		
	
func on_NPC_body_exited(body):
	if body.get_filename() == MainInstances.player.get_filename():
		$Sprite.visible= false
		active = false 
		
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed('ui_accept') and active and not quest_active:
			get_tree().paused = true
			var dialog = Dialogic.start('timeline-2')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			dialog.connect('dialogic_signal', self, 'quest_dialogic_event')
			add_child(dialog)

func unpause(timeline_name):
	get_tree().paused = false
	start_animations()
	state = WANDER	
	
func quest_dialogic_event(param):
	if( param == "quest_instance"):
		get_parent().get_parent().add_child(quest.instance())
	
func start_animations():
	$AnimationTree.active = true
	
	
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
		INTERACT:
			pass
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
	
