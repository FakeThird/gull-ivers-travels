extends CharacterBody2D
class_name Player

enum PlayerState { FLYING, DEAD }

@export var stats: PlayerStats
@export var current_state: PlayerState = PlayerState.DEAD
@export var stamina_cost: float = 5.0
@export var weight_cost: float = 5.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var movement_component: Node = $MovementComponent
@onready var stamina_component: Node = $StaminaComponent
@onready var weight_component: Node = $WeightComponent
@onready var animation_component: Node = $AnimationComponent

func _ready() -> void:
	current_state = PlayerState.DEAD
	sprite.sprite_frames.set_animation_loop("flap", true)

func _on_flap_performed() -> void:
	if stamina_component:
		stamina_component.decrease_stamina(stamina_cost)
	
	if weight_component:
		weight_component.decrease_weight(weight_cost)
		
	if animation_component:
		animation_component.play("flap")
		
	print("stamina: " + str(stats.current_stamina) + ", weight: " + str(stats.current_weight))

func start() -> void:
	if not stats or not sprite or not movement_component:
		return
	
	current_state = PlayerState.FLYING
	position = Vector2(100, 360)
	stats.current_stamina = 100.0
	stats.current_weight = 100.0
	movement_component.start()
	
	if weight_component:
		weight_component.start()
		
	if animation_component:
		sprite.sprite_frames.set_animation_loop("flap", false)

func stop() -> void:
	if not sprite or not movement_component:
		return
		
	current_state = PlayerState.DEAD
	movement_component.stop()
	
	if animation_component:
		animation_component.play("death")

func consume_item(type: String, count: int, value: float) -> void:
	if stamina_component:
		match type:
			"Fish":
				stamina_component.increase_stamina(count * value)
	
	if weight_component:
		match type:
			"Fish":
				weight_component.increase_weight(count * value)
		
	print("stamina: " + str(stats.current_stamina) + ", weight: " + str(stats.current_weight))
