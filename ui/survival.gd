extends TextureProgressBar

func _ready():
	max_value = 100
	value = 0
	GameEvents.timer_updated.connect(_on_timer_updated)

func _on_timer_updated(reason: String, percent: float, is_active: bool):
	if is_active and reason == "Sky Kill Area":
		value = percent * 100
		if value == 0:
			$AnimationPlayer.play("dash")
			$Cry.play()
	else:
		value = 0
 
