extends Node2D

var start = [
	preload("res://Assets/Scenes/Ground/Plain.tscn")
]

var segments = [
	preload("res://Assets/Scenes/Ground/deadEnd.tscn"),
	preload("res://Assets/Scenes/Ground/endEnemy.tscn"),
	preload("res://Assets/Scenes/Ground/multiEndBar.tscn"),
	preload("res://Assets/Scenes/Ground/end2Enemy.tscn"),
	preload("res://Assets/Scenes/Ground/multiBar.tscn")
]

var speed = 400

func _ready():
	randomize()
	spawn_start(0,0)
	spawn_inst(1024,0)
	spawn_inst(2048,0)
	spawn_inst(3072,0)

func _physics_process(delta):
	for area in $Spwaner.get_children():
		area.position.x -= speed*delta
		if area.position.x < -2048:
			spawn_inst(area.position.x+4096,0)
			area.queue_free()

func spawn_inst(x,y):
	var inst = segments[randi() % len(segments)].instance()
	print(inst)
	inst.position = Vector2(x, y)
	$Spwaner.add_child(inst)

func spawn_start(a,b):
	var inst = start[0].instance()
	print(inst)
	inst.position = Vector2(a, b)
	$Spwaner.add_child(inst)
