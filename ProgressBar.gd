extends ProgressBar

export var next_scene = ""

var load_time = 3 
onready var tween = $Tween

func _ready():
	tween.interpolate_property($Control, "value", 0, 100, load_time, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()



func _on_Tween_tween_completed(object, key):
	if next_scene != null:
		get_tree().change_scene(next_scene)
