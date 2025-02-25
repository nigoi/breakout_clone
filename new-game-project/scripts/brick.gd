extends RigidBody2D
signal brick_broken(type, brick_position)

func die():
	emit_signal("brick_broken", "green", position)
	call_deferred("queue_free")
