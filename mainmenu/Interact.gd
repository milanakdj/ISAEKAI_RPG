extends Control

signal CloseInteractMenu

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ExitGame_pressed():
	emit_signal("CloseInteractMenu")
