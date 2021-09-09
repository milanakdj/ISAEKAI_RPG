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
	get_node("Walk").queue_free()


func _on_TextureButton2_pressed():
	var run_menu = load("res://mainmenu/Run.tscn").instance()
	add_child(run_menu)
	get_node("Run").connect("CloseRunMenu", self, "CloseRunMenu")


func CloseRunMenu():
	get_node("Run").queue_free()

