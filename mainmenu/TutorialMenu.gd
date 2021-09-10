extends Control

signal CloseTutorialMenu


func _ready():
	pass # Replace with function body.


func _on_ExitGame_pressed():
	emit_signal("CloseTutorialMenu")


func _on_TextureButton_pressed():
	var walk_menu = load("res://mainmenu/Walk.tscn").instance()
	add_child(walk_menu)
	get_node("Walk").connect("CloseWalkMenu", self, "CloseWalkMenu")
	

func CloseWalkMenu():
	print("this is")
	get_node("Walk").queue_free()


func _on_TextureButton2_pressed():
	var run_menu = load("res://mainmenu/Run.tscn").instance()
	add_child(run_menu)
	get_node("Run").connect("CloseRunMenu", self, "CloseRunMenu")


func CloseRunMenu():
	get_node("Run").queue_free()



func _on_TextureButton3_pressed():
	var attack_menu = load("res://mainmenu/Attack.tscn").instance()
	add_child(attack_menu)
	get_node("Attack").connect("CloseAttackMenu", self, "CloseAttackMenu")


func CloseAttackMenu():
	get_node("Attack").queue_free()



func _on_TextureButton4_pressed():
	var story_menu = load("res://mainmenu/Story.tscn").instance()
	add_child(story_menu)
	get_node("Story").connect("CloseStoryMenu", self, "CloseStoryMenu")


func CloseStoryMenu():
	get_node("Story").queue_free()


func _on_TextureButton5_pressed():
	var goals_menu = load("res://mainmenu/Goals.tscn").instance()
	add_child(goals_menu)
	get_node("Goals").connect("CloseGoalsMenu", self, "CloseGoalsMenu")


func CloseGoalsMenu():
	get_node("Goals").queue_free()




func _on_TextureButton6_pressed():
	var interact_menu = load("res://mainmenu/Interact.tscn").instance()
	add_child(interact_menu)
	get_node("Interact").connect("CloseInteractMenu", self, "CloseInteractMenu")


func CloseInteractMenu():
	get_node("Interact").queue_free()

