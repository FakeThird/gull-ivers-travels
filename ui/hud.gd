extends CanvasLayer

@onready var title: Label = $Title
@onready var caption: Label = $Caption
@onready var distance: Label = $Distance

func _ready() -> void:
	title.hide()
	
func show_start(first: bool) -> void:
	if not first:
		if distance.milestones_reached >= 20:
			title.text = "The Great Albatross"
		elif distance.milestones_reached >= 10:
			title.text = "Bird of Prey"
		elif distance.milestones_reached >= 5:
			title.text = "Buoy Bouncer"
		elif distance.milestones_reached >= 1:
			title.text = "Salt Spray Scout"
		else:
			title.text = "Fluffed Fledgling"
		title.show()
	caption.show()

func hide_start() -> void:
	title.hide()
	caption.hide()
	
