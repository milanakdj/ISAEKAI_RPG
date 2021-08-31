extends Node2D

export(String, FILE) var next_scene = ""
#export (PackedScene) var scene_1
var start = preload("res://UI/MainMenu.tscn");
var scene_2 = preload("res://Scene/Start-Cutscene.tscn")


func _ready():
	pass
	#var scene_instance1 = start.instance()
	#$Node2D.add_child(scene_instance1)
	#var start_Cutscene = $Node2D.getchild().find_node("Start-Cutscene")
	#start_Cutscene.connect("change_to_level", self, "start_game")
	#	var player = find_parent("CurrentScene").get_children().back().find_node("Player")
func transition_to_scene(new_scene: String):
	next_scene = new_scene
	$ScreenTransition/AnimationPlayer.play("FadeToBlack")
	
func finished_fading():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(load(next_scene).instance())
	$ScreenTransition/AnimationPlayer.play("FadeToNormal")

func first_scene():
	$Node2D.add_child(load(next_scene).instance())

func change_scene_to():
	$Node2D.get_child(0).queue_free()
	var scene_instance2 = scene_2.instance()
	$Node2D.add_child(scene_instance2)
	
	
func start_game():
	$Node2D.get_child(0).queue_free()
	$CurrentScene.add_child(load(next_scene).instance())
