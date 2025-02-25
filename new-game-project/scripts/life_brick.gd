extends RigidBody2D
signal brick_broken(type, brick_position)

func die():
	emit_signal("brick_broken", "pink", position)
	call_deferred("queue_free")
