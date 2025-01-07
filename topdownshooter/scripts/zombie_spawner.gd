extends Node2D

@export var quantity: int

var zombie_scene = preload("res://scenes/zombie.tscn")

func _on_timer_timeout() -> void:
	for z in range(quantity):
		var zombie = zombie_scene.instantiate()
		zombie.global_position = Vector2(randi_range(-50, 50), randi_range(-50, 50))
		get_parent().add_child(zombie)
