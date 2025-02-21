extends Control
var lives = 4
var balls = 1
var score = 0

func spawn_ball():
	#removes ball and life drom count
	lives -= 1
	balls -= 1
	#restarts scene if lives and balls are ou
	if lives == 0 and balls == 0:
		get_tree().reload_current_scene()
	#else spawns ball, connects signal and adds ball to coun
	else:
		var ball = preload("res://scenes/ball.tscn")
		var ball_inst = ball.instantiate()
		add_child(ball_inst)
		balls += 1
		ball_inst.connect("dead_ball", self.spawn_ball)
		print("lives: ", lives, " balls: ", balls, " score: ", score)
			
func _ready() -> void:
	spawn_ball()
