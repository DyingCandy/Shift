extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



func open():
	collision_shape_2d.queue_free()
	animated_sprite_2d.play("Opening")
	z_index = 1
