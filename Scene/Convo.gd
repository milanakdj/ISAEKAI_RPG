extends RichTextLabel

var dialogs : Dictionary
var page = 0

signal move_player
signal truck_kun
signal completed

var scene_name

func _ready():
	#scene_name = get_tree().current_scene.name
	scene_name = "Start-Cutscene"
	dialogs = JsonData.loadData("res://Data/dialogs.json");
	text = dialogs[scene_name][page].convo
	set_visible_characters(0)
	set_process_input(true)

func _input(event):
	if get_parent().visible:
		if event.is_action_pressed("interact") || event.is_action_pressed("attack"):
			if page == 3:
				set_process_input(false)
				get_parent().visible = false
				emit_signal("move_player")
				return
			if page == 4:
				get_parent().visible = false
				set_process_input(false)
				emit_signal("truck_kun")
				return
			if page == dialogs[scene_name].size() - 1:
				get_tree().current_scene.find_node("Ambulance").visible = true
				get_tree().current_scene.find_node("Ambulance").play_siren()
				get_tree().current_scene.find_node("AnimationPlayer").play("fadeIn")
				set_process_input(false)
				get_parent().visible = false
				emit_signal("completed")
				return
			if get_visible_characters() > get_total_character_count():
				if page < dialogs[scene_name].size()-1:
					page += 1
					text = dialogs[scene_name][page].convo
					visible_characters = 0

func _on_textTimer_timeout():
	set_visible_characters(get_visible_characters()+1)

func on_move_finish():
	set_process_input(true)
	page += 1
	text = dialogs[scene_name][page].convo
	visible_characters = 0
	get_parent().visible = true
	
func _fade_out():
	get_tree().current_scene.find_node("AnimationPlayer").play("fadeOut")
	$"Timer#1".start(3)

func _on_Timer1_timeout():
	set_process_input(true)
	page += 1
	text = dialogs[scene_name][page].convo
	visible_characters = 0
	get_parent().visible = true
