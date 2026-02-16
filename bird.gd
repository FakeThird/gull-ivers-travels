extends CharacterBody2D
class_name Player

enum State { FLYING, DIVING, DEAD }

@export var base_gravity = 900.0
@export var base_flap_power = -400.0
@export var stamina = 100.0
@export var weight = 0.0
@export var horizontal_speed = 200
@export var current_state = State.DEAD

@onready var sprite = $Sprite2D/ColorRect

func _ready() -> void:
	current_state = State.DEAD
	velocity = Vector2.ZERO
	set_physics_process(false)
	
func start() -> void:
	position = Vector2(100, 360)
	current_state = State.FLYING
	velocity.x = horizontal_speed
	sprite.color = Color.WHITE
	set_physics_process(true)
	
func stop() -> void:
	current_state = State.DEAD
	velocity = Vector2.ZERO
	sprite.color = Color.RED
	set_physics_process(false)

func _physics_process(delta: float) -> void:
	match current_state:
		State.FLYING:
			var gravity_mod = base_gravity + (weight * 5.0)
			velocity.y += gravity_mod * delta
			
			if Input.is_action_just_pressed("flap"):
				flap()
				
			move_and_slide()
			
		State.DEAD:
			velocity = Vector2.ZERO
			
	
func flap() -> void:
	var flap_mod = base_flap_power + (weight * 3.0)
	velocity.y = flap_mod
	stamina -= 5.0
	
	if weight > 0:
		weight = max(0, weight - 0.5)
		
func eat_fish() -> void:
	stamina = min(100, stamina + 20)
	weight += 10.0
