extends Controllable

@onready var sprite = $AnimatedSprite2D
var direction : Vector2
@export var speed : int = 120

func handle_controlled(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, accel)
		velocity.y = move_toward(velocity.y, 0, accel)
	animation()
	move_and_slide()

func handle_uncontrolled(_delta: float) -> void:
	sprite.frame = 0


func animation():
	if direction:
		if direction.x > 0 and direction.y == 0:
			sprite.play("Walking - Left_Right")
			sprite.flip_h = false
		elif direction.x < 0 and direction.y == 0:
			sprite.play("Walking - Left_Right")
			sprite.flip_h = true
		elif direction.y < 0:
			sprite.play("Walking - Back")
			sprite.flip_h = false
		elif direction.y > 0:
			sprite.play("Walking - Forward")
			sprite.flip_h = false
	else: 
		sprite.frame = 0
