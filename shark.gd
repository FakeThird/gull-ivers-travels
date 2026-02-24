extends Node2D

@export var gravity: float = 900
@export var jump_force: float = -600

var velocity: Vector2 = Vector2.ZERO

func _ready():
	set_physics_process(false)

func _physics_process(delta: float):
	velocity.y += gravity * delta
	position.y += velocity.y * delta
	
	if velocity.y > 0 and position.y > 515:
		queue_free()

func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body is Player:
		velocity.y = jump_force
		set_physics_process(true)
