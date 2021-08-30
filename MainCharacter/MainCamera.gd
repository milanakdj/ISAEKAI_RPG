extends Camera2D

onready var TopLeft = $Node/TopLeft
onready var BottomRight = $Node/BottomRight

func _ready():
	limit_top = TopLeft.position.y
	limit_left = TopLeft.position.x
	limit_right = BottomRight.position.x
	limit_bottom = BottomRight.position.y
