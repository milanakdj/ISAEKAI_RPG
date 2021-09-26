extends CanvasModulate

const Night_color  = Color("#415c77")
const Day_color = Color("#ffffff")
const Time_scale = 0.1

var time = 0 

func _process(delta):
	self.time  += delta * Time_scale
	self.color = Night_color.linear_interpolate(Day_color, ((sin(time)+1)/2))
