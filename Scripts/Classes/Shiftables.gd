extends CharacterBody2D
class_name Controllable

@export var is_controlled : bool = false
@onready var phantom_camera_2d: PhantomCamera2D = $PhantomCamera2D
@onready var player: CharacterBody2D = $Player
var time_elapsed : float = 0.0
var target_time : float = 0.3

@export var speed : int = 165
var accel : int = 100

func _ready() -> void:
	if not is_in_group("Shiftable"):
		add_to_group("Shiftable")
	else:
		pass

func _physics_process(delta: float) -> void:
	if is_controlled == false:
		pass
		
	elif is_controlled == true:
		time_elapsed += delta
		if time_elapsed >= target_time:
			handle_controlled(delta)
			if Input.is_action_just_pressed("shift"):
				print("shift to soul")
				shift_to_soul()
				time_elapsed = 0
	
	

func handle_uncontrolled(_delta: float) -> void:
	pass

func handle_controlled(_delta: float) -> void:
	pass

func shift_to_soul():
	is_controlled = false
	var soul = get_tree().get_first_node_in_group("Player")
	soul.soul_controlled(Vector2(global_position.x + 30, global_position.y))
	
