extends Node

@export var stats: PlayerStats
@export var default_modifier: float = 5.0
@export var shed_rate: float = 0.5

func _ready() -> void:
	if not stats:
		return
	
	set_process(false)

func _process(delta: float) -> void:
	if not stats:
		return
	
	decrease_weight(shed_rate * delta)

func increase_weight(amount: float = default_modifier) -> void:
	if not stats:
		return
	
	stats.current_weight += amount

func decrease_weight(amount: float = default_modifier) -> void:
	if not stats:
		return
	
	stats.current_weight -= amount
	
func start() -> void:
	set_process(true)

func stop() -> void:
	set_process(false)
