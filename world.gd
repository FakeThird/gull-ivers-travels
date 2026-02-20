extends Node2D

@onready var bird = $Bird
@onready var distance = $HUD/Distance
@onready var hud = $HUD

func _ready() -> void:
	$OceanSounds.play()
	
func _input(event):
	if bird.current_state == bird.State.DEAD:
		if event.is_action_pressed("flap"):
			bird.start()
			distance.start()
			hud.hide_title()

func _on_kill_zone_died(reason: Variant) -> void:
	bird.stop()
	distance.stop()
	hud.show_title()
	print(reason)
	
func _on_kill_zone_2_died(reason: Variant) -> void:
	bird.stop()
	distance.stop()
	hud.show_title()
	print(reason)
