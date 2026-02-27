extends Control

var world_scene = preload("./world.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("flap"):
		start_game()

func _on_start_button_down() -> void:
	start_game()

func start_game() -> void:
	get_tree().call_deferred("change_scene_to_packed", world_scene)
