extends Node2D

export(String, FILE) var next_scene = ""
#export (PackedScene) var scene_1
var start = preload("res://UI/MainMenu.tscn");
#var scene_2 = preload("res://Scene/Start-Cutscene.tscn")
var current_scene = null

func _ready():
	var root = get_tree().get_root()
	current_scene = start.instance()
	#var scene_instance1 = start.instance()
	#$Node2D.add_child(scene_instance1)
	#var start_Cutscene = $Node2D.getchild().find_node("Start-Cutscene")
	#start_Cutscene.connect("change_to_level", self, "start_game")
	#	var player = find_parent("CurrentScene").get_children().back().find_node("Player")

func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	print("this is")
	current_scene.queue_free()
	print("this is it")
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	$Node2D.add_child(current_scene)
	
	
func transition_to_scene(new_scene: String):
	next_scene = new_scene
	$ScreenTransition/AnimationPlayer.play("FadeToBlack")
	
func finished_fading():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(load(next_scene).instance())
	$ScreenTransition/AnimationPlayer.play("FadeToNormal")
