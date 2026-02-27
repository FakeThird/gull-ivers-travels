extends Node2D

func _on_visibility_changed() -> void:
	if not visible:
		queue_free()
