extends Area2D

signal activated
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _on_body_entered(body: Node2D) -> void:
	collision_shape_2d.disabled = true
	animated_sprite_2d.play("green")
	activated.emit()
