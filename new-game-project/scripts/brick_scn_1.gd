extends Node2D
signal plus_point

var level_1 = [Vector2(320, 200), Vector2(320, 184), Vector2(320, 168), Vector2(392, 200), Vector2(248, 200), Vector2(248, 184), Vector2(392, 184), Vector2(248, 168), Vector2(392, 168), Vector2(320, 200), Vector2(320, 184), Vector2(320, 168), Vector2(392, 200), Vector2(248, 200), Vector2(248, 184), Vector2(392, 184), Vector2(248, 168), Vector2(176, 200), Vector2(176, 184), Vector2(176, 168), Vector2(176, 152), Vector2(176, 136), Vector2(176, 120), Vector2(176, 104), Vector2(176, 88), Vector2(176, 72), Vector2(464, 104), Vector2(464, 88), Vector2(464, 72), Vector2(464, 152), Vector2(464, 136), Vector2(464, 120), Vector2(464, 200), Vector2(464, 184), Vector2(464, 168), Vector2(392, 168), Vector2(320, 152), Vector2(320, 136), Vector2(320, 120), Vector2(392, 152), Vector2(248, 152), Vector2(248, 136), Vector2(392, 136), Vector2(248, 120), Vector2(392, 120), Vector2(320, 104), Vector2(320, 88), Vector2(320, 72), Vector2(392, 104), Vector2(248, 104), Vector2(248, 88), Vector2(392, 88), Vector2(248, 72), Vector2(392, 72)]
var level_2 = 0
var brick_number = 0
var level_select = [level_1, level_2] 

func spawn_bricks(level_select):
	for level in level_select:
		for position in level:
			await get_tree().create_timer(0.01).timeout
			var brick = preload("res://scenes/brick.tscn")
			var brick_inst = brick.instantiate()
			add_child(brick_inst)
			brick_number += 1
			brick_inst.position = position
			brick_inst.connect("brick_broken", self.emit)

func emit():
	emit_signal("plus_point")
	brick_number -= 1
	print("bricks left =", brick_number)
	if brick_number == 0:
		spawn_bricks(level_select)

func _ready() -> void:
	print("brickscene loader initialising")
	spawn_bricks(level_select)
	
