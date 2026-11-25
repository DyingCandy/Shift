extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.next_level_timer.start()
		print("NextButtonPressed")
		sprite.play("Wooshie away")
