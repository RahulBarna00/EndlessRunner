extends Area2D

func _on_Enemy_body_entered (body):
	if body.name == "Player":
		body.die()
