extends Area2D

signal died(reason)

@onready var bird = Player

func _on_body_entered(body):
	if body.name == "Bird":
		$Timer.start()
		print("Entered kill zone...")

func _on_body_exited(body):
	if body.name == "Bird":
		$Timer.stop()
		print("Exited kill zone...")

func _on_timer_timeout():
	# This is where the Seagull dies
	print("Bird died...")
	died.emit("KillZone")
