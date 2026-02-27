extends Area2D

@onready var timer: Timer = $Timer
@export var wait_time: float = 0.01
@export var reason: String = "Kill Area"
@export var export_timer: bool = false

signal kill_area_entered
signal kill_area_exited

func _ready() -> void:
	if timer:
		timer.wait_time = wait_time
		
func _process(_delta: float) -> void:
	if export_timer and not timer.is_stopped():
		var percent = timer.time_left / timer.wait_time
		GameEvents.timer_updated.emit(percent, true)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		kill_area_entered.emit()
		timer.start()
		if export_timer:
			GameEvents.timer_updated.emit(1.0, true)

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		kill_area_exited.emit()
		timer.stop()
		if export_timer:
			GameEvents.timer_updated.emit(0.0, false)

func _on_timer_timeout() -> void:
	GameEvents.player_killed.emit(reason)
	if export_timer:
		GameEvents.timer_updated.emit(0.0, false)
