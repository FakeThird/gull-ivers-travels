extends Label

@export var stats: PlayerStats

func _process(delta: float) -> void:
	text = "%dkg" % (stats.current_weight)
	if stats.current_weight > 200:
		label_settings.font_color = Color("f31400")
	elif stats.current_weight > 150:
		label_settings.font_color =Color("ff6854")
	elif stats.current_weight > 100:
		label_settings.font_color = Color("ffc2b7")
	else:
		label_settings.font_color = Color("ffffffff")
