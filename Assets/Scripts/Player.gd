extends KinematicBody2D

var score : int = 0

var jumpForce : int = 750
var gravity : int = 1200
var vel : Vector2 = Vector2()

# var grounded : bool = false
# onready var sprite = $AnimatedSprite


func _physics_process(delta):
	vel = move_and_slide(vel, Vector2.UP)

	vel.y += gravity * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce

func die ():
	get_tree().reload_current_scene()
