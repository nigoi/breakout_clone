extends RigidBody2D
var lives = 3
signal brick_broken

func _on_area_2d_body_entered(body: Node2D) -> void:
	lives -= 1
	if lives == 0:
		self.queue_free()
		emit_signal("brick_broken")
