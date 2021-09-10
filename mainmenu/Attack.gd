extends Control

signal CloseAttackMenu


func _ready():
	pass # Replace with function body.


func _on_ExitGame_pressed():
	emit_signal("CloseAttackMenu")

