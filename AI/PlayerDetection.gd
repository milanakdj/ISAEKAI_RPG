extends Area2D

var player = null

signal entered
signal exited

func can_see_player():
	return player != null

func _on_PlayerDetection_body_entered(body):
	player = body
	emit_signal("entered")

func _on_PlayerDetection_body_exited(_body):
	player = null
	emit_signal("exited")
