extends ParallaxBackground

#warning-ignore:unused_argument
func _process(delta):
	scroll_base_offset -= Vector2(3,0)

func _on_Parallax_body_entered(body):
	if body.name == "Player":
		body.die()
