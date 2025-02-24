extends RigidBody2D
signal brick_broken(type, brick_position)

func _on_area_2d_body_entered(body: Node2D) -> void:
	emit_signal("brick_broken", "pink", position)
	self.queue_free()
