extends Camera2D

@export var target: CharacterBody2D
@export var vertical_fixed_pos: float = 360
@export var horizontal_offset: float = 450

func _process(_delta):
	if target:
		# We only take the X from the bird
		# We keep the Y at a fixed constant height
		global_position.x = target.global_position.x + horizontal_offset
		global_position.y = vertical_fixed_pos
