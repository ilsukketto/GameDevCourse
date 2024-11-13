extends CharacterBody2D

var speed: float = 200.0

func _process(delta: float) -> void:
	
	var mouse_pos = get_global_mouse_position()
	var mouse_dir = mouse_pos - global_position
	rotation = atan2(mouse_dir.y, mouse_dir.x)
	
	if Input.is_action_pressed("sprint"):
		speed = 400.0
	else:
		speed = 200.0
	
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	position += direction * speed * delta
	
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		print("shoot")
