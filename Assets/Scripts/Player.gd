extends KinematicBody2D

# warning-ignore:unused_argument
var score : int = 0

var jumpForce : int = 700
var gravity : int = 1250
var vel : Vector2 = Vector2()

onready var sprite = $AnimatedSprite

func _physics_process(delta):
	vel.y += gravity * delta
	if is_on_floor() and !Input.is_action_just_pressed("down") and !Input.is_action_pressed("jump"):
		gravity = 1250
		sprite.play("RUN")

	elif Input.is_action_pressed("jump") and is_on_floor():
		sprite.play("JUMP")
		vel.y -= jumpForce

	elif Input.is_action_just_pressed("down"):
		gravity = 4000
	
	vel = move_and_slide(vel, Vector2.UP)

func die ():
	get_tree().change_scene("res://Assets/Scenes/MainUI.tscn")
