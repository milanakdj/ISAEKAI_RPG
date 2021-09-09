extends Control

signal CloseRunMenu


func _ready():
	pass # Replace with function body.


func _on_ExitGame_pressed():
	emit_signal("CloseRunMenu")

