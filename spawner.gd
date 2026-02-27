extends Marker2D
class_name Spawner

@export var world: World
@export var fish_scene: PackedScene
@export var shark_scene: PackedScene
@export var buoy_scene: PackedScene
@export var rock_scene: PackedScene
@export var ship_scene: PackedScene

var last_spawn_x = 0
var spawn_interval = 300
	
func _ready() -> void:
	set_process(false)

func _process(_delta: float) -> void:
	if global_position.x - last_spawn_x >= spawn_interval:
		spawn_object()
		last_spawn_x = global_position.x

func spawn_object() -> void:
	if not world or not fish_scene or not shark_scene:
		return
	
	var chance = randf()
	var new_obj
	
	if chance <= 0.50:
		new_obj = fish_scene.instantiate()
	elif chance <= 0.85:
		new_obj = shark_scene.instantiate()
	elif chance <= 0.95:
		new_obj = buoy_scene.instantiate()
	elif chance <= 0.99:
		new_obj = rock_scene.instantiate()
	elif chance <= 1.00:
		new_obj = ship_scene.instantiate()
	
	world.add_child(new_obj)
	new_obj.position = global_position

func clear() -> void:
	clear_group("spawnables")

func clear_group(group_name: String) -> void:
	var items = get_tree().get_nodes_in_group(group_name)
	print(items)
	for item in items:
		print("removed")
		item.queue_free()

func start() -> void:
	last_spawn_x = 0.0
	clear()
	set_process(true)

func stop() -> void:
	set_process(false)
