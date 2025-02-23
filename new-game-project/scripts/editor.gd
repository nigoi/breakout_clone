extends Node

var level_layout = {}

func get_type_location():
	for brick in self.get_children():
		var base_name = brick.name.rstrip("0123456789")
		if not level_layout.has(base_name):
			level_layout[base_name] = []
		level_layout[base_name].append("Vector2" + str(brick.position))

	for key in level_layout.keys():
		print(key + ": " + str(level_layout[key]))

func _ready() -> void:
	get_type_location()
