extends CharacterBody2D

@export var speed : int = 200
var accel : int = 100
@export var is_soul_controlled : bool = true
@onready var player: CharacterBody2D = $"."

@onready var phantom_camera_2d: PhantomCamera2D = $"../PhantomCamera2D"

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _ready() -> void:
	pass

func find_nearest_shiftables(): 
	var shiftable_enemies = get_tree().get_nodes_in_group("Shiftable")
	var nearest_shiftable : Node = null
	var min_distance_squared : float = INF
	
	for shiftable in shiftable_enemies:
		if not "global_position" in shiftable:
			continue
		
		var distance_squared = global_position.distance_squared_to(shiftable.global_position)
		if distance_squared < min_distance_squared:
			min_distance_squared = distance_squared
			nearest_shiftable = shiftable
			print(nearest_shiftable)
	return nearest_shiftable
	
	

func shift():
	if is_soul_controlled == true:
		is_soul_controlled = false
		phantom_camera_2d.follow_target = find_nearest_shiftables()
		find_nearest_shiftables().is_controlled = true
		print(find_nearest_shiftables())

func _physics_process(delta: float) -> void:
	#Movement
	
	if is_soul_controlled == true:
		sprite_2d.show()
		collision_shape_2d.disabled = false
		var direction = Input.get_vector("left", "right", "up", "down")
		if direction:
			velocity = direction * speed
		else:
			velocity.x = move_toward(velocity.x, 0, accel)
			velocity.y = move_toward(velocity.y, 0, accel)
			
		move_and_slide()
	elif is_soul_controlled == false:
		sprite_2d.hide()
		collision_shape_2d.disabled = true
	
	
	#Shifting
	if Input.is_action_just_pressed("shift"):
		shift()
	

func soul_controlled(new_position : Vector2):
	global_position = new_position
	phantom_camera_2d.follow_target = player
	is_soul_controlled = true
