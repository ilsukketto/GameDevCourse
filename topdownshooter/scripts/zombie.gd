class_name Zombie extends CharacterBody2D

var speed: float = 100.0

var player: Player

var follow_distance = 50

@onready var health_bar: ProgressBar = $HealthBar

var health: int = 100

func _ready() -> void:
	player = get_parent().get_node("Player")

func _process(delta: float) -> void:
	if player != null:
		var direction: Vector2 = player.global_position - global_position
		var distance = direction.length()
		
		if distance > follow_distance:
			direction = direction.normalized()
			velocity = direction * speed
		else:
			velocity = Vector2.ZERO
		
		move_and_slide()
		
		if health <= 0:
			queue_free()
		
		health_bar.value = health
