extends AnimatedSprite

func _ready():
	play("Animate")

func _on_GrassEffect_animation_finished():
	queue_free()
