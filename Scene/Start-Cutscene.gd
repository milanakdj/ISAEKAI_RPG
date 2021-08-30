extends Node2D

var main = preload("res://Main.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Ambulance.visible = false
	$CanvasLayer/DialogBox/Convo.connect("move_player", self, "on_move_player")
	$CanvasLayer/DialogBox/Convo.connect("truck_kun", self, "on_truck_kun")
	$CanvasLayer/DialogBox/Convo.connect("completed", self, "on_completed")

func _on_car_pass():
	$Timer.start(3)
	
func on_move_player():
	$AnimationPlayer.play("playerdown")
	$Timer.stop()

func on_truck_kun():
	$AnimationPlayer.play("truck-kun")

func _on_Timer_timeout():
	$AnimationPlayer.play("carMove1")
	$Timer.stop()

func on_completed():
	$Timer2.start(5)

func _on_Timer2_timeout():
	$Camera.play("cameraOut")

func _on_level_change():
	Global.new_game = true
	get_tree().change_scene_to(main)
