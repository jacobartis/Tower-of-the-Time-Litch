extends Node2D
class_name RoomManager

@export var waves:int = 1
var current_wave = 0

func _ready():
	connect_spawners()

func connect_spawners():
	for x in get_spawners():
		x.monster_killed.connect(check_spawners)

func start_room():
	spawn_wave()

func spawn_wave():
	for x in get_spawners():
		x.spawn_wave(current_wave)
	current_wave += 1

func check_spawners():
	if !get_spawners().all(func(x):return !x.active):return
	if current_wave==waves:
		print("room_finished")
	else:
		spawn_wave()

func get_spawners():
	return get_children().filter(func(x):return x is Spawner)
