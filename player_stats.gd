extends Resource
class_name PlayerStats

signal stamina_replenished
signal stamina_depleted

@export var max_stamina: float = 100.0
@export var max_weight: float = 200.0
@export var normal_weight: float = 100.0

@export var current_stamina: float = 100.0:
	set(value):
		if current_stamina <= 0 and value > 0:
			stamina_replenished.emit()
		current_stamina = clamp(value, 0.0, max_stamina)
		if current_stamina <= 0:
			stamina_depleted.emit()

@export var current_weight: float = 100.0:
	set(value):
		current_weight = clamp(value, 0.0, max_weight)

@export var current_score: int = 0
