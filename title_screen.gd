extends Control

func _on_start_button_down() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://world.tscn")
