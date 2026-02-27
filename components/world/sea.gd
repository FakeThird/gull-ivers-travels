extends Node2D

@export var splash: AudioStreamPlayer2D

func _on_kill_area_kill_area_entered() -> void:
	splash.play() 

func _on_kill_area_kill_area_exited() -> void:
	splash.play()
