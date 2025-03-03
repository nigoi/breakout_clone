extends RigidBody2D
var speed = Global.speed 
var start_draw = true
var velocity = Vector2.ZERO
@onready var viewport_size = get_viewport().get_visible_rect().size
signal dead_ball
var collider = null
	
func _draw() -> void:
	if start_draw == true:
		var mouse_pos = to_local(get_viewport().get_mouse_position())
		draw_line(Vector2.ZERO, mouse_pos, Color.WHITE, 1)
		
func _process(delta: float) -> void:
	var speed = Global.speed 
	if start_draw == true:
		queue_redraw()
	if Input.is_action_just_pressed("space") and start_draw == true:
		start_draw = false
		var mouse = to_local(get_viewport().get_mouse_position())
		velocity = (Vector2.ZERO + mouse).normalized()
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
	
