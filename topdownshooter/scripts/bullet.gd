extends Area2D

var speed: float = 400.0
var direction: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	
	

func destroy(body: Node2D):
	if body is Zombie:
		body.health -= 25
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
