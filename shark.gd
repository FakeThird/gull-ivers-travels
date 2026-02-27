extends Node2D

@export var gravity: float = 900
@export var jump_force: float = -600

var velocity: Vector2 = Vector2.ZERO

func _ready():
	set_physics_process(false)
	
func _process(delta: float) -> void:
	if velocity.length() > 0.1:
		$AnimatedSprite2D.rotation = lerp_angle($AnimatedSprite2D.rotation, velocity.angle() + PI, 0.2)

func _physics_process(delta: float):
	velocity.y += gravity * delta
	position.y += velocity.y * delta
	
	if velocity.y > 0 and position.y > 515:
		$Splash.play()
		queue_free()

func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body is Player:
		$Chomp.play()
		velocity.y = jump_force
		set_physics_process(true)

func on_spawn() -> void:
	var roll = randf_range(0, 6)
	position.y += roll * 20
	roll = randf_range(0, 5)
	jump_force -= roll * 40
