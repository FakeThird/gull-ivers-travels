extends Node2D
class_name World

@onready var player = $Player
@onready var spawner = $FollowCamera/Spawner
@onready var hud = $HUD
@onready var distance = $HUD/Distance

func _ready() -> void:
	GameEvents.player_killed.connect(_on_player_killed)
	GameEvents.item_collected.connect(_on_item_collected)
	hud.show_start()
	
func _input(event):
	if player.current_state == player.PlayerState.DEAD:
		if event.is_action_pressed("flap"):
			hud.hide_start()
			distance.start()
			spawner.start()
			player.start()

func _on_player_killed(reason: Variant) -> void:
	spawner.stop()
	player.stop()
	distance.stop()
	hud.show_start()
	print(reason)
	
func _on_item_collected(type: String, count: int, value: float) -> void:
	player.consume_item(type, count, value)
	print(type)
