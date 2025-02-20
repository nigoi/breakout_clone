extends Node2D

func _draw() -> void:
	draw_line(position - position, get_global_mouse_position(), 1)
