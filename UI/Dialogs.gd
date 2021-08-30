extends ColorRect

var dialogs : Dictionary
var page = 0

onready var convoBox = $Convo

var scene_name
signal done

func _ready():
	visible = false
	scene_name = get_tree().current_scene.name
	dialogs = JsonData.loadData("res://Data/dialogs.json");

func _load_dialogs():
	visible = true
	convoBox.text = dialogs[scene_name][page].convo
	convoBox.set_visible_characters(0)
	set_process_input(true)

func _input(event):
	if visible:
		if event.is_action_pressed("interact") || event.is_action_pressed("attack"):
			if page == dialogs[scene_name].size() - 1:
				visible = false
				set_process_input(false)
				emit_signal("done")
			if convoBox.get_visible_characters() > convoBox.get_total_character_count():
				if page < dialogs[scene_name].size()-1:
					page += 1
					convoBox.text = dialogs[scene_name][page].convo
					convoBox.visible_characters = 0

func _on_Timer_timeout():
	convoBox.set_visible_characters(convoBox.get_visible_characters()+1)
