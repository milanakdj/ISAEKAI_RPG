extends Control


export(String, FILE) var next_scene = ""

func _ready():
	$AnimationPlayer.play("fadeIn");

func _on_NewGame_pressed():
	$AnimationPlayer.play("fade")

func _on_press_play():
	print(get_tree().current_scene)
	get_node(NodePath("/root/SceneManager")).change_scene_to()

func _on_ExitGame_pressed():
	get_tree().quit(1);
