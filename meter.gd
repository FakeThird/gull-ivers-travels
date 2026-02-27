extends Label

func _ready():
	visible = false
	GameEvents.timer_updated.connect(_on_timer_updated)

func _on_timer_updated(percent: float, is_active: bool):
	if is_active:
		visible = true
		text = "%.1f" % (percent * 100.0)
	else:
		visible = false
 
