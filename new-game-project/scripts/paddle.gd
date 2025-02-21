extends RigidBody2D
var move = false
var velocity = Vector2.ZERO
var speed = 400

func _ready() -> void:
	position = Vector2(get_viewport().size.x / 2, get_viewport().size.y * 0.9)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("space"):
		move = true

func _process(delta: float) -> void:
	if move:
		if Input.is_action_pressed("left"):
			velocity.x = lerp(velocity.x, -1.0, 0.2)
		if Input.is_action_pressed("right"):
			velocity.x = lerp(velocity.x, 1.0, 0.2)
		else:
			velocity.x = lerp(velocity.x, 0.0, 0.05)
	move_and_collide(velocity * speed * delta)
