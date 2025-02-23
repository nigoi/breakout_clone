extends Control
var lives = 3
var balls = 0
var score = 0
@onready var viewport_size = get_viewport().get_visible_rect().size
@onready var paddle: RigidBody2D = $"../../paddle"
@onready var score_label: Label = $HBoxContainer/score_label
@onready var lives_label: Label = $HBoxContainer2/lives_label

func spawn_ball():
	balls -= 1
	if balls < 1:
		lives -= 1
		spawn_sub_ball("complex", Vector2(viewport_size.x / 2, viewport_size.y * 0.9))
		paddle.position = Vector2(viewport_size.x / 2, viewport_size.y * 0.9)
		paddle.move = false
		paddle.velocity.x = 0
	if lives < 1:
		get_tree().reload_current_scene()

func spawn_sub_ball(type, ball_position):
	if type == "complex":
		var ball = preload("res://scenes/ball.tscn")
		var ball_inst = ball.instantiate()
		add_child(ball_inst)
		ball_inst.position = ball_position
		balls += 1
		ball_inst.connect("dead_ball", self.spawn_ball)
		print("lives: ", lives, " balls: ", balls, " score: ", score)
	if type == "simple":
		var ball = preload("res://scenes/ball_simple.tscn")
		var ball_inst = ball.instantiate()
		add_child(ball_inst)
		ball_inst.position = ball_position
		balls += 1
		ball_inst.connect("dead_ball", self.spawn_ball)
		
func spawn_bricks():
	var bricks_load = preload("res://scenes/brick_scn_1.tscn")
	var bricks_inst = bricks_load.instantiate()
	add_child(bricks_inst)
	bricks_inst.connect("plus_point", self.add_score)
	
func add_score(type, brick_position):
	print("message received. Brick position", brick_position)
	if type == "green":
		score += 1
		score_label.text = ("SCORE: " + str(score))
		$AudioStreamPlayer2D.play()
		print("score: ", score)
	if type == "blue":
		var new_ball = spawn_sub_ball("simple", brick_position)
		score += 3
		score_label.text = ("SCORE: " + str(score))
		print("score: ", score)

func _ready() -> void:
	score_label.text = ("SCORE: " + str(score))
	lives_label.text = ("LIVES: " + str(lives))
	spawn_bricks()
	spawn_sub_ball("complex", Vector2(viewport_size.x / 2, viewport_size.y * 0.9))
