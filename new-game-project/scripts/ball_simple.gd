extends RigidBody2D
var speed = Global.speed 
@onready var velocity = Vector2(1, 1)
signal dead_ball
@onready var viewport_size = get_viewport().get_visible_rect().size
var collider = null
	
func _process(delta: float) -> void:
	var speed = Global.speed * 0.75
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		$AnimatedSprite2D.play("bouncing")
		$AudioStreamPlayer2D.play()
		collider = collision.get_collider()
		if collider.has_method("die"):
			collider.die()
	else:
		collider = null
		
	if position.y > viewport_size.y:
		emit_signal("dead_ball")
		queue_free()
		print("dead ball")
	
