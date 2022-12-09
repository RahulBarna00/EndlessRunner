extends Control

var score_file = "user://highscore.txt"
var highscore = 0
var temp2

func _ready():
	load_score()
	temp2 = "HighScore: \n\n000" + str(highscore)
	$"highscore".text=temp2

func _on_Button_button_down():
	get_tree().change_scene("res://Assets/Scenes/MainScene.tscn")

func load_score():
	var f = File.new()
	if f.file_exists(score_file):
		f.open(score_file, File.READ)
		var content = f.get_as_text()
		highscore = int(content)
		f.close()
