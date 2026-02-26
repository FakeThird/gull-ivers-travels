extends Label

var time_elapsed: float = 0.0
var milestones_reached: int = 0
var linger_timer: float = 0.0

func _ready() -> void:
	set_process(false)

func _process(delta: float) -> void:
	time_elapsed += delta
	var total_distance = time_elapsed * 10.0
	
	if int(total_distance / 100.0) > milestones_reached:
		milestones_reached += 1
		linger_timer = 1.0        
		$Milestone.play()
	
	if linger_timer > 0:
		linger_timer -= delta
		text = "%.1fm" % (milestones_reached * 100.0)
	else:
		text = "%.1fm" % total_distance


func start() -> void:
	time_elapsed = 0
	set_process(true)

func stop() -> void:
	set_process(false)
