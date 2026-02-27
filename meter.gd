extends TextureProgressBar

func _ready():
	max_value = 100
	value = 0
	GameEvents.timer_updated.connect(_on_timer_updated)

func _on_timer_updated(reason: String, percent: float, is_active: bool):
	if is_active and reason == "Sea Kill Area":
		print(reason)
		value = percent * 100
	else:
		value = 0
 
