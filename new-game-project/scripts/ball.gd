extends RigidBody2D
var speed = 600 
var start_draw = false
var velocity = Vector2.ZERO

func _draw() -> void:
	if start_draw == true:
		var mouse_pos = to_local(get_viewport().get_mouse_position())
		draw_line(Vector2.ZERO, mouse_pos, Color.WHITE, 1)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("space"):
		start_draw = !start_draw
		queue_redraw()
		var mouse = to_local(get_viewport().get_mouse_position())
		velocity = (mouse - position).normalized()
		print(velocity)
		
func _process(delta: float) -> void:
	if start_draw:
		queue_redraw()
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
