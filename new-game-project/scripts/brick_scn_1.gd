extends Node2D
signal plus_point

var level_1 = [Vector2(320, 200), Vector2(320, 184), Vector2(320, 168), Vector2(392, 200), Vector2(248, 200), Vector2(248, 184), Vector2(392, 184), Vector2(248, 168), Vector2(392, 168), Vector2(320, 200), Vector2(320, 184), Vector2(320, 168), Vector2(392, 200), Vector2(248, 200), Vector2(248, 184), Vector2(392, 184), Vector2(248, 168), Vector2(176, 200), Vector2(176, 184), Vector2(176, 168), Vector2(176, 152), Vector2(176, 136), Vector2(176, 120), Vector2(176, 104), Vector2(176, 88), Vector2(176, 72), Vector2(464, 104), Vector2(464, 88), Vector2(464, 72), Vector2(464, 152), Vector2(464, 136), Vector2(464, 120), Vector2(464, 200), Vector2(464, 184), Vector2(464, 168), Vector2(392, 168), Vector2(320, 152), Vector2(320, 136), Vector2(320, 120), Vector2(392, 152), Vector2(248, 152), Vector2(248, 136), Vector2(392, 136), Vector2(248, 120), Vector2(392, 120), Vector2(320, 104), Vector2(320, 88), Vector2(320, 72), Vector2(392, 104), Vector2(248, 104), Vector2(248, 88), Vector2(392, 88), Vector2(248, 72), Vector2(392, 72)]
var level_2 = { "BlueBrick": Vector2(320, 192), "GreenBrick": Vector2(320, 184) }
var brick_number = 0
var level_select = [level_2] 
var level_layout = {}

func get_type_location():
	for brick in self.get_children():
		level_layout[brick.name] = "Vector2" + str(brick.position)
	print(level_layout)

func _ready() -> void:
	get_type_location()

#func spawn_bricks(level_select):
	#for level_keys in level_select:
		#for brick_name in level_keys:
			#var position = level_keys[brick_name]
			#
			#var brick_scene
			#if brick_name == "BlueBrick":
				#brick_scene = preload("res://scenes/ball_brick.tscn")
				#brick_number += 3
#
			#elif brick_name == "GreenBrick":
				#brick_scene = preload("res://scenes/brick.tscn")
				#brick_number += 1
				#
			#var brick_inst = brick_scene.instantiate()
			#add_child(brick_inst)
			#brick_inst.position = position
			#brick_inst.connect("brick_broken", self.emit)
#
#
#func emit():
	#emit_signal("plus_point")
	#brick_number -= 1
	#print("bricks left =", brick_number)
	#if brick_number == 0:
		#spawn_bricks(level_select)
##
#func _ready() -> void:
	#print("brickscene loader initialising")
	#spawn_bricks(level_select)
	#print(brick_number)
	
