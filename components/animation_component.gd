extends Node

@export var back_sprite: AnimatedSprite2D
@export var body_sprite: AnimatedSprite2D
@export var front_sprite: AnimatedSprite2D
@export var animation: Node2D

@export var flap_sound: AudioStreamPlayer2D
@export var death_sound: AudioStreamPlayer2D

@onready var body: CharacterBody2D = get_parent()

func _process(_delta: float) -> void:
	if not body_sprite or not body:
		return
	
	if body.velocity.length() > 0.1:
		animation.rotation = lerp_angle(animation.rotation, body.velocity.angle(), 0.2)

func play(action: String) -> void:
	if not body_sprite or not flap_sound or not death_sound:
		return
	
	match action:
		"flap":
			back_sprite.stop()
			body_sprite.stop()
			front_sprite.stop()
			back_sprite.play("flap")
			body_sprite.play("flap")
			front_sprite.play("flap")
			flap_sound.play()
		"death":
			back_sprite.play("die")
			body_sprite.play("die")
			front_sprite.play("die")
			death_sound.play()
