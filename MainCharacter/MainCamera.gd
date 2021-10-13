extends Camera2D

var MainInstances = ResourceLoader.MainInstances

onready var TopLeft = $Node/TopLeft
onready var BottomRight = $Node/BottomRight

func _ready():
	limit_top = TopLeft.position.y
	limit_left = TopLeft.position.x
	limit_right = BottomRight.position.x
	limit_bottom = BottomRight.position.y
	MainInstances.WorldCamera = self
	
func _exit_tree():
	MainInstances.WorldCamera = null
