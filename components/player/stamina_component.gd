extends Node

@export var stats: PlayerStats
@export var default_modifier: float = 5.0

func increase_stamina(amount: float = default_modifier) -> void:
	if not stats:
		return
	
	stats.current_stamina += amount

func decrease_stamina(amount: float = default_modifier) -> void:
	if not stats:
		return
	
	stats.current_stamina -= amount
