extends Area2D

@export var type: String = "Collectible"
@export var count: int = 1
@export var value: float = 1.0

func _on_body_entered(body: Node2D) -> void:
	if body is Player and get_parent():
		GameEvents.item_collected.emit(type, count, value)
		get_parent().queue_free()
