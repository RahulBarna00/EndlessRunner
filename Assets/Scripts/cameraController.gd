extends Camera2D

onready var player = get_node("/root/MainScene/Player")

# warning-ignore:unused_argument
func _process(delta):
	position.x = player.position.x
	#position.y = player.position.y
