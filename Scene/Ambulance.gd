extends Sprite

var change = 0

func _on_Timer_timeout():
	if change == 0:
		$Light2D.color = Color.blue
		$Light2D2.color = Color.red
		change = 1
	else:
		$Light2D.color = Color.red
		$Light2D2.color = Color.blue
		change = 0

func play_siren():
	$AudioStreamPlayer.playing = true
