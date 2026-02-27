extends Node

signal flap_performed

@export var stats: PlayerStats
@export var gravity: float = 900.0
@export var flap_force: float = -500.0
@export var horizontal_speed: float = 200.0

@onready var body: CharacterBody2D = get_parent()

var weight_multiplier: float
var flap_enabled: bool

func _ready() -> void:
	if not stats or not body:
		return
	
	set_physics_process(false)
	body.velocity.x = horizontal_speed
	flap_enabled = true
	stats.stamina_replenished.connect(_on_stamina_replenished)
	stats.stamina_depleted.connect(_on_stamina_depleted)

func _physics_process(delta: float) -> void:
	if not stats or not body:
		return
	
	weight_multiplier = clamp(stats.current_weight / stats.normal_weight, 1.0, 2.0)
	body.velocity.y += gravity * weight_multiplier * delta
	
	if flap_enabled and Input.is_action_just_pressed("flap"):
		body.velocity.y = flap_force / weight_multiplier
		flap_performed.emit()
	
	body.move_and_slide()

func _on_stamina_replenished() -> void:
	flap_enabled = true

func _on_stamina_depleted() -> void:
	flap_enabled = false

func start() -> void:
	set_physics_process(true)

func stop() -> void:
	set_physics_process(false)
