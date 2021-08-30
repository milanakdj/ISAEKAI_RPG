extends Control

var MAX_HEALTH

onready var health_bar = $HealthBarUi
onready var health_below = $HeathBarBelow
onready var tween = $Tween

export (Color) var Normal = Color.green
export (Color) var Cautious = Color.yellow
export (Color) var Danger = Color.red 

func _ready():
	MAX_HEALTH = get_parent().MAX_HEALTH
	health_bar.value = MAX_HEALTH
	health_below.value = MAX_HEALTH
	health_bar.max_value = MAX_HEALTH
	health_below.max_value = MAX_HEALTH
	
func _on_health_updated(health):
	health_bar.value = health
	tween.interpolate_property(health_below, "value", health_below.value, health, 0.4, tween.TRANS_SINE, tween.EASE_IN_OUT, 0.4)
	tween.start()
	
	_assign_color(health)

func _assign_color(health):
	if health <= health_bar.max_value * 0.5:
		health_bar.tint_progress = Cautious
	elif health <= health_bar.max_value * 0.2:
		health_bar.tint_progress = Danger
	else:
		health_bar.tint_progress = Normal
