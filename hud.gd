extends CanvasLayer

@onready var title: Label = $Title
@onready var caption: Label = $Caption

func show_start() -> void:
	title.show()
	caption.show()

func hide_start() -> void:
	title.hide()
	caption.hide()
