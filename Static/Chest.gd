extends StaticBody2D

onready var interactDetect = $Interact
onready var animationPlayer = $AnimationPlayer
onready var chest = $ChestSprite

var isInteractable = false
var empty = false

signal opened

onready var chest_loots = $LootUI/ChestLootUi

func _ready():
	$Label.visible = false
	$LootUI/ChestLootUi.visible = false
	chest.frame = 0
	
func _process(delta):
	if empty:
		emit_signal("opened")
	if $Label.visible:
		animationPlayer.play("LabelFloat")
	if isInteractable:
		if Input.is_action_just_pressed("interact"):
			chest.frame = 1
			if chest_loots.loot_item.size() > 0:
				$LootUI/ChestLootUi.visible = true
			else:
				empty = true

func _on_Interact_body_entered(body):
	$Label.visible = true
	isInteractable = true

func _on_Interact_body_exited(body):
	$Label.visible = false
	isInteractable = false
	$LootUI/ChestLootUi.visible = false
	
