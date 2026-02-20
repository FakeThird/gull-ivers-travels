extends Label

var time_elapsed: float = 0.0
var is_running: bool = false

func _ready() -> void:
	set_process(false)

func start() -> void:
	set_process(true)
	time_elapsed = 0
	is_running = true
	
func stop() -> void:
	set_process(false)
	is_running = false
	
func _process(delta: float) -> void:
	if is_running:
		time_elapsed += delta
		text = "%.1f m" % (time_elapsed * 10.0)
