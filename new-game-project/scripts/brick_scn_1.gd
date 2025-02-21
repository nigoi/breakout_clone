extends Node2D
signal plus_point

var brick_positions = [Vector2(320, 200), Vector2(320, 184), Vector2(320, 168), Vector2(392, 200), Vector2(248, 200), Vector2(248, 184), Vector2(392, 184), Vector2(248, 168), Vector2(392, 168), Vector2(320, 200), Vector2(320, 184), Vector2(320, 168), Vector2(392, 200), Vector2(248, 200), Vector2(248, 184), Vector2(392, 184), Vector2(248, 168), Vector2(176, 200), Vector2(176, 184), Vector2(176, 168), Vector2(176, 152), Vector2(176, 136), Vector2(176, 120), Vector2(176, 104), Vector2(176, 88), Vector2(176, 72), Vector2(464, 104), Vector2(464, 88), Vector2(464, 72), Vector2(464, 152), Vector2(464, 136), Vector2(464, 120), Vector2(464, 200), Vector2(464, 184), Vector2(464, 168), Vector2(392, 168), Vector2(320, 152), Vector2(320, 136), Vector2(320, 120), Vector2(392, 152), Vector2(248, 152), Vector2(248, 136), Vector2(392, 136), Vector2(248, 120), Vector2(392, 120), Vector2(320, 104), Vector2(320, 88), Vector2(320, 72), Vector2(392, 104), Vector2(248, 104), Vector2(248, 88), Vector2(392, 88), Vector2(248, 72), Vector2(392, 72)]

func collect():
	for child in get_children():
		brick_positions.append("Vector2" + str(child.position))

#func _ready() -> void:
	#collect()
	#print(brick_positions)
	#brick location function do not delete

func spawn_bricks():
	for position in brick_positions:
		var brick = preload("res://scenes/brick.tscn")
		var brick_inst = brick.instantiate()
		add_child(brick_inst)
		brick_inst.position = position
		brick_inst.connect("body_entered", self.emit)

func emit():
	emit_signal("plus_point")
	print("brick broken")

func _ready() -> void:
	spawn_bricks()
