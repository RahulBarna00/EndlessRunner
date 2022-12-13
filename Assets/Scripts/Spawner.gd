extends Node2D

var score_file = "user://highscore.txt"
var highscore = 0
var temp
var temp2
var score
var time = 0

var start = [
	preload("res://Assets/Scenes/Ground/Easy/Plain.tscn")
]

var easy = [
	preload("res://Assets/Scenes/Ground/Easy/deadEnd.tscn"),
	preload("res://Assets/Scenes/Ground/Easy/endEnemy.tscn"),
	preload("res://Assets/Scenes/Ground/Easy/multiEndBar.tscn"),
	preload("res://Assets/Scenes/Ground/Easy/end2Enemy.tscn"),
	preload("res://Assets/Scenes/Ground/Easy/multiBar.tscn"),
	preload("res://Assets/Scenes/Ground/Easy/airBox.tscn"),
	preload("res://Assets/Scenes/Ground/Easy/boxStair.tscn")
]

var speed = 400

func _ready():
	load_score()
	randomize()
	spawn_start(0,0)
	spawn_inst(1024,0)
	spawn_inst(2048,0)
	spawn_inst(3072,0)

func _physics_process(delta):
	time = time + 0.15
	
	temp = int(time)
	
	score= "000"+str(temp)
	
	$"CanvasLayer/score".text=score
	
	if temp>highscore:
		save_score()
	
	for area in $Spwaner.get_children():
		area.position.x -= speed*delta
		if area.position.x < -2048:
			spawn_inst(area.position.x+4096,0)
			area.queue_free()

func spawn_inst(x,y):
	var inst = easy[randi() % len(easy)].instance()
	#print(inst)
	inst.position = Vector2(x, y)
	$Spwaner.add_child(inst)

func spawn_start(a,b):
	var inst = start[0].instance()
	#print(inst)
	inst.position = Vector2(a, b)
	$Spwaner.add_child(inst)

func load_score():
	var f = File.new()
	if f.file_exists(score_file):
		f.open(score_file, File.READ)
		var content = f.get_as_text()
		highscore = int(content)
		f.close()

func save_score():
	var f = File.new()
	f.open(score_file, File.WRITE)
	f.store_string(str(score))
	f.close()
