extends Node2D

@onready var bird = $Bird

func _ready() -> void:
	pass
	
func _input(event):
	if bird.current_state == bird.State.DEAD:
		if event.is_action_pressed("flap"):
			bird.start()

func _on_kill_zone_died(reason: Variant) -> void:
	bird.stop()
	print(reason)
	
func _on_kill_zone_2_died(reason: Variant) -> void:
	bird.stop()
	print(reason)
