extends RigidBody2D
signal brick_broken

func _on_area_2d_body_entered(body: Node2D) -> void:
	emit_signal("brick_broken")
	self.queue_free()
