extends Node2D

onready var healthBar = $HealthBar
onready var experienceBar = $ExperienceBar
onready var staminaBar = $StaminaBar

func _ready():
	PlayerStats.connect("exp_change", self, "on_cur_exp_updated")
	PlayerStats.connect("level_up", self, "on_level_up")
	$LevelLabel.text = "LVL: " + str(PlayerStats.level)
	healthBar.max_value = PlayerStats.MAX_HEALTH
	healthBar.value = PlayerStats.health
	staminaBar.max_value = PlayerStats.MAX_STAMINA
	staminaBar.value = PlayerStats.stamina
	experienceBar.max_value = PlayerStats.next_exp
	experienceBar.value = PlayerStats.cur_exp

func on_health_updated(health):
	healthBar.value = health

func on_stamina_updated(stamina):
	staminaBar.value = stamina

func on_max_health_updated(health):
	healthBar.max_value = health

func on_max_stamina_updated(stamina):
	staminaBar.max_value = stamina

func on_next_exp_updated(next_exp):
	experienceBar.max_value = next_exp

func on_cur_exp_updated(cur_exp):
	experienceBar.value = cur_exp

func on_level_up(level):
	$LevelLabel.text = "LVL: " + str(level)
