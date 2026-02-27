extends Node2D

@onready var collect_area := $CollectArea

func _on_visibility_changed() -> void:
	if not visible:
		queue_free()

func on_spawn() -> void:
	var roll = randf_range(0, 5)
	position.y += roll * 20
	collect_area.value += roll * 2
