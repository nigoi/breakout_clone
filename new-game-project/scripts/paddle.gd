extends RigidBody2D
var move = false
var velocity = Vector2.ZERO
var speed = 600
@onready var viewport_size = get_viewport().get_visible_rect().size 

func _ready() -> void:
	position = Vector2(viewport_size.x / 2, viewport_size.y * 0.9)

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
	var collision = move_and_collide(velocity * speed * delta)
