extends Control

var mainMenu = preload("res://UI/MainMenu.tscn")

func _ready():
	visible = false

func _input(event):
	if get_parent().isGame:
		if event.is_action_pressed("escape"):
			visible = true

func _on_ResumeGame_pressed():
	visible = false

func _on_MainMenu_pressed():
	$AnimationPlayer.play("fade")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene_to(mainMenu)
	visible = false
	UserInterface.isGame = false
