extends Node2D
signal plus_point(type)

var level_1 = {"brick": [Vector2(320, 240), Vector2(320, 224), Vector2(320, 208), Vector2(320, 192), Vector2(192, 240), Vector2(192, 224), Vector2(192, 208), Vector2(192, 192), Vector2(448, 240), Vector2(448, 224), Vector2(448, 208), Vector2(448, 192), Vector2(256, 160), Vector2(256, 144), Vector2(256, 128), Vector2(256, 112), Vector2(384, 160), Vector2(384, 144), Vector2(384, 128), Vector2(384, 112)],
"ball_brick": [Vector2(192, 176), Vector2(256, 96), Vector2(384, 96), Vector2(320, 176), Vector2(448, 176)]}
var level_2 = {"brick": [Vector2(320, 248), Vector2(248, 248), Vector2(176, 232), Vector2(464, 232), Vector2(464, 216), Vector2(392, 232), Vector2(320, 232), Vector2(248, 232), Vector2(176, 216), Vector2(176, 200), Vector2(464, 200), Vector2(320, 216), Vector2(320, 200), Vector2(392, 248), Vector2(392, 248), Vector2(176, 184), Vector2(248, 184), Vector2(104, 168), Vector2(536, 184), Vector2(536, 168), Vector2(104, 184), Vector2(104, 184), Vector2(464, 184), Vector2(392, 184), Vector2(320, 168), Vector2(320, 152), Vector2(176, 152), Vector2(176, 136), Vector2(464, 152), Vector2(464, 136)],
"ball_brick": [Vector2(320, 184), Vector2(176, 168), Vector2(464, 168)]}
var brick_number = 0
var level_select = [level_1, level_2] 
var level_index = 0

func spawn_bricks(level_select):
	var level = level_select[level_index]
	level_index += 1
	for brick_name in level:
		var brick_scene
		if brick_name == "brick":
			brick_scene = preload("res://scenes/brick.tscn")

		elif brick_name == "ball_brick":
			brick_scene = preload("res://scenes/ball_brick.tscn")
				
		for position in level[brick_name]:
			if brick_name == "brick":
				brick_number += 1
			elif brick_name == "ball_brick":
				brick_number += 1
			var brick_inst = brick_scene.instantiate()
			call_deferred("add_child", brick_inst)
			brick_inst.position = position
			brick_inst.connect("brick_broken", self.emit)

func emit(type, brick_position):
	if type == "green":
		emit_signal("plus_point", "green", brick_position)
	if type == "blue":
		emit_signal("plus_point", "blue", brick_position)
		print(brick_position)
	brick_number -= 1
	Global.speed += 1
	print("speed now", Global.speed)
	print("bricks left =", brick_number)
	if brick_number == 0:
		spawn_bricks(level_select)
#
func _ready() -> void:
	print("brickscene loader initialising")
	spawn_bricks(level_select)
	print("bricks =", brick_number)
	
