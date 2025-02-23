extends RigidBody2D
signal brick_broken(type, brick_position)

func _on_area_2d_body_entered(body: Node2D) -> void:
	emit_signal("brick_broken", "green", position)
	self.queue_free()
