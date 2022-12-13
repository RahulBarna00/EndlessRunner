extends KinematicBody2D

# warning-ignore:unused_argument
var score : int = 0

var jumpForce : int = 700
var gravity : int = 1250
var vel : Vector2 = Vector2()

onready var sprite = $AnimatedSprite

func _physics_process(delta):
	#sprite.play("RUN")
	vel.y += gravity * delta
	
	#elif Input.is_action_pressed("jump") and is_on_floor():
	#	sprite.play("JUMP")
	#	vel.y -= jumpForce

	if is_on_floor():
		gravity = 1250
		sprite.play("RUN")

	vel = move_and_slide(vel, Vector2.UP)

func die ():
	get_tree().change_scene("res://Assets/Scenes/MainUI.tscn")
	#yield(get_tree().create_timer(0.5),"timeout")

func _on_down_button_down():
	gravity = 4000

func _on_down_button_up():
	if is_on_floor():
		sprite.play("RUN")
	else:
		sprite.play("JUMP")

func _on_up_button_down():
	sprite.play("JUMP")
	if is_on_floor():
		vel.y -= jumpForce

func _on_up_button_up():
	if is_on_floor():
		sprite.play("RUN")
	else:
		sprite.play("JUMP")
