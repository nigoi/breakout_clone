extends RigidBody2D
var speed = 600 
var start_draw = true
var velocity = Vector2.ZERO
signal dead_ball

func _ready() -> void:
	position = Vector2(get_viewport().size.x / 2, get_viewport().size.y * 0.9)

func _draw() -> void:
	if start_draw == true:
		var mouse_pos = to_local(get_viewport().get_mouse_position())
		draw_line(Vector2.ZERO, mouse_pos, Color.WHITE, 1)
		
func _process(delta: float) -> void:
	if start_draw == true:
		queue_redraw()
	if Input.is_action_just_pressed("space"):
		start_draw = false
		var mouse = to_local(get_viewport().get_mouse_position())
		velocity = (Vector2.ZERO + mouse).normalized()

	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		$AnimatedSprite2D.play()
	
	if position.y > get_viewport().size.y:
		emit_signal("dead_ball")
		queue_free()
		print("dead ball")
	
