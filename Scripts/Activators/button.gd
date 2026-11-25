extends Area2D

signal activated
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@export var door: StaticBody2D
var button_activated: bool = false

func _ready() -> void:
	activated.connect(door.open)

func _on_body_entered(body: Node2D) -> void:
	
	if button_activated == false:
		collision_shape_2d.disabled = true
		animated_sprite_2d.play("green")
		activated.emit()
		button_activated = true
	
