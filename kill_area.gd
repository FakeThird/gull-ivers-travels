extends Area2D

@onready var timer: Timer = $Timer
@export var wait_time: float = 0.01
@export var reason: String = "Kill Area"

signal kill_area_entered
signal kill_area_exited

func _ready() -> void:
	if timer:
		timer.wait_time = wait_time

func _on_body_entered(body: Node2D) -> void:
	kill_area_entered.emit()
	if body is Player:
		timer.start()

func _on_body_exited(body: Node2D) -> void:
	kill_area_exited.emit()
	if body is Player:
		timer.stop()

func _on_timer_timeout() -> void:
	GameEvents.player_killed.emit(reason)
