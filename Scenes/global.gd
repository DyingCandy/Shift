extends Node

@onready var next_level_timer: Timer = $NextLevel

func _on_end_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
	print("level change")
