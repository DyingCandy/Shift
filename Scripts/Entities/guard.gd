extends Controllable

@onready var sprite = AnimatedSprite2D

func handle_controlled(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, accel)
		velocity.y = move_toward(velocity.y, 0, accel)
		
	move_and_slide()
	if velocity.x < 0 and velocity.y == 0:
		
