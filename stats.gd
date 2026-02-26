extends TextureProgressBar

@export var stats: PlayerStats

func _ready():
	# Sync the bar's max range to your resource's max stamina
	if stats:
		max_value = stats.max_stamina
		value = stats.current_stamina

func _process(_delta):
	if stats:
		# 1. Update the scale (essential!)
		max_value = stats.max_stamina
		# 2. Update the visual value
		value = stats.current_stamina
		
		# Keep max_value in sync if it can be upgraded during gameplay
		if max_value != stats.max_stamina:
			max_value = stats.max_stamina
