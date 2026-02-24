extends Label

var time_elapsed: float = 0.0

func _ready() -> void:
	set_process(false)

func _process(delta: float) -> void:
	time_elapsed += delta
	text = "%.1fm" % (time_elapsed * 10.0)

func start() -> void:
	time_elapsed = 0
	set_process(true)

func stop() -> void:
	set_process(false)
