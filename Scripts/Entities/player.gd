extends CharacterBody2D

var speed : int = 250
var shifted : bool
var shifter
var guard : bool


func _physics_process(delta: float) -> void:
	#Movement
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	move_and_slide()
