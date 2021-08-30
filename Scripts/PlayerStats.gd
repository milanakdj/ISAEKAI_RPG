extends "res://Scripts/Stats.gd"

var player_name : String

var level = 1
var cur_exp = 0 setget set_cur_exp
var next_exp = 40

export var MAX_STAMINA = 100.0 setget set_max_stamina
var stamina = MAX_STAMINA setget set_stamina

signal level_up(value)
signal coin_updated(value)
signal exp_change(value)

var attack = 5
var defence = 5

var coin = 0 setget set_coin

func set_coin(value):
	coin = value
	emit_signal("coin_updated", coin)

func set_cur_exp(value):
	cur_exp += value
	if cur_exp >= next_exp:
		cur_exp = 0
		var prev_level = level
		self.level += 1
		next_exp = (prev_level + level) * 16
		emit_signal("level_up", level)
	emit_signal("exp_change", cur_exp)

func set_max_stamina(value):
	MAX_STAMINA = value
	self.stamina = min(stamina, MAX_STAMINA)
	
func set_stamina(value):
	stamina = value
