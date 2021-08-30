extends Node

var MAX_HEALTH = 100.0 setget set_max_health
var health = MAX_HEALTH setget set_health

signal no_health

func set_health(value):
	health = value
	if health <= 0:
		emit_signal("no_health")

func set_max_health(value):
	MAX_HEALTH = value
	self.health = min(health, MAX_HEALTH)

func _ready():
	self.health = MAX_HEALTH

