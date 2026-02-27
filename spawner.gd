extends Marker2D
class_name Spawner

@export var world: World
@export var spawn_interval_min: float = 200
@export var spawn_interval_max: float = 500
@export var scenes: Dictionary[StringName, PackedScene] = {}
#@export var fish_scene: PackedScene
#@export var shark_scene: PackedScene
#@export var buoy_scene: PackedScene
#@export var rock_scene: PackedScene
#@export var ship_scene: PackedScene

var pools: Dictionary = {}
var last_spawn_x: float = 0.0
var next_interval: float = 300.0

var weights = {
	"fish": 0.50,
	"shark": 0.35,
	"buoy": 0.10,
	"rock": 0.04,
	"ship": 0.01
}
	
func _ready() -> void:
	set_process(false)

func _process(_delta: float) -> void:
	if global_position.x - last_spawn_x >= next_interval:
		#spawn_from_pool()
		spawn_object()
		last_spawn_x = global_position.x
		# Randomize next interval for a more "natural" feel
		next_interval = randf_range(spawn_interval_min, spawn_interval_max)

#func spawn_from_pool():
	#var type = _get_weighted_type()
	#if not scenes.has(type): return
	#
	#var obj: Node2D
	#
	## 1. Try to grab from pool
	#if pools.has(type) and pools[type].size() > 0:
		#obj = pools[type].pop_back()
	#else:
		## 2. If pool empty, instantiate new
		#obj = scenes[type].instantiate()
		#obj.add_to_group("spawnables")
		#world.add_child(obj)
	#
	## 3. Reset and Position
	#obj.global_position = global_position
	#if obj.has_method("on_spawn"):
		#obj.on_spawn() # We tell the object to randomize itself!
	#obj.show()
	#obj.set_process(true)

func _get_weighted_type() -> String:
	var roll = randf()
	var cumulative = 0.0
	for type in weights:
		cumulative += weights[type]
		if roll <= cumulative:
			return type
	return "fish"

func recycle_object(type: String, obj: Node2D):
	obj.hide()
	obj.set_process(false)
	if not pools.has(type):
		pools[type] = []
	pools[type].append(obj)

func spawn_object() -> void:
	var type = _get_weighted_type()
	
	if not scenes.has(type):
		return
	
	var new_obj: Node2D = scenes[type].instantiate()
	world.add_child(new_obj)
	new_obj.position = global_position
	if new_obj.has_method("on_spawn"):
		new_obj.on_spawn()

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
