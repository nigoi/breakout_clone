extends Control
var lives = 3
var balls = 0
var score = 0

func spawn_ball():
	if balls > 1:
		balls -= 1
		#remove 1 life
		if balls < 1:
			lives -= 1
			#update label
		#if lives = 0 restart scene
			if lives < 1:
				get_tree().reload_current_scene()
		#reset paddle
	
	#spawn ball
	else:
		var ball = preload("res://scenes/ball.tscn")
		var ball_inst = ball.instantiate()
		add_child(ball_inst)
		balls += 1
		if ball_inst:
			ball.connect("dead_ball", self.spawn_ball)
	
func _ready() -> void:
	spawn_ball()
