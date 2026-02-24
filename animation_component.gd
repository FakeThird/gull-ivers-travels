extends Node

@export var sprite: AnimatedSprite2D
@export var flap_sound: AudioStreamPlayer2D
@export var death_sound: AudioStreamPlayer2D

@onready var body: CharacterBody2D = get_parent()

func _process(_delta: float) -> void:
	if not sprite or not body:
		return
	
	if body.velocity.length() > 0.1:
			sprite.rotation = lerp_angle(sprite.rotation, body.velocity.angle(), 0.2)

func play(action: String) -> void:
	if not sprite or not flap_sound or not death_sound:
		return
	
	match action:
		"flap":
			sprite.stop()
			sprite.play("flap")
			flap_sound.play()
			await sprite.animation_finished
			sprite.play("dive")
		"death":
			sprite.play("die")
			death_sound.play()
			await sprite.animation_finished
			sprite.play("dead")
