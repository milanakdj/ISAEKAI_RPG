extends AnimatedSprite

func _ready():
	play("Animate")
	connect("animation_finished", self, "queue_free")
