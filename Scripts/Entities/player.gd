extends CharacterBody2D

var speed : int = 250
var accel : int = 100


func _physics_process(delta: float) -> void:
	#Movement
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, accel)
		velocity.y = move_toward(velocity.y, 0, accel)
	move_and_slide()
