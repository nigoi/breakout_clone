extends Control
var lives = 4
var balls = 1
var score = 0
@onready var paddle: RigidBody2D = $"../../paddle"
@onready var score_label: Label = $HBoxContainer/score_label
@onready var lives_label: Label = $HBoxContainer2/lives_label

func spawn_ball():
	#reset paddle
	paddle.move = false
	paddle.position = Vector2(get_viewport().get_visible_rect().size.x / 2, get_viewport().get_visible_rect().size.y * 0.9)
	paddle.velocity = Vector2.ZERO
	#removes ball and life drom count
	lives -= 1
	balls -= 1
	lives_label.text = ("LIVES: " + str(lives))
	#restarts scene if lives and balls are ou
	if lives == 0 and balls == 0:
		print("you lose")
		get_tree().reload_current_scene()
	#else spawns ball, connects signal and adds ball to coun
	else:
		var ball = preload("res://scenes/ball.tscn")
		var ball_inst = ball.instantiate()
		add_child(ball_inst)
		balls += 1
		ball_inst.connect("dead_ball", self.spawn_ball)
		print("lives: ", lives, " balls: ", balls, " score: ", score)

func spawn_bricks():
	var bricks_load = preload("res://scenes/brick_scn_1.tscn")
	var bricks_inst = bricks_load.instantiate()
	add_child(bricks_inst)
	bricks_inst.connect("plus_point", self.add_score)
	
func add_score():
	score += 1
	score_label.text = ("SCORE: " + str(score))
	print("score: ", score)

func _ready() -> void:
	score_label.text = ("SCORE: " + str(score))
	lives_label.text = ("LIVES: " + str(lives))
	spawn_bricks()
	spawn_ball()
