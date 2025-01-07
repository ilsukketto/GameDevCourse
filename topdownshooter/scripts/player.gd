class_name Player extends CharacterBody2D

var speed: float = 200.0

var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")

var health: float = 100

var ammo_magazine: int = 16
var ammo_reserve: int = 999

var can_shoot: bool = true

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
	
	$UI/HealthBar.value = health
	$UI/AmmoLabel.text = str(ammo_magazine) + " / " + str(ammo_reserve)
	
	if health <= 0:
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	if Input.is_action_just_pressed("reload"):
		reload()

func shoot():
	if ammo_magazine > 0 and can_shoot == true:
		$ShotFX.play() # Esegue il suono di sparo
		
		# Genera il proiettile e lo istanzia nella scena principale
		var bullet = bullet_scene.instantiate()
		bullet.global_position = $Pivot.global_position
		var bullet_dir = Vector2(cos(rotation), sin(rotation))
		bullet.direction = bullet_dir
		get_parent().add_child(bullet)
		
		ammo_magazine -= 1
		
		can_shoot = false
		$Cooldown.start()

func reload():
	var ammo_to_reload: int = 16 - ammo_magazine
	$Sprite2D.texture = load("res://graphics/player/survivor1_machine_christmas.png")
	await get_tree().create_timer(1.7).timeout
	$Sprite2D.texture = load("res://graphics/player/survivor1_reload_christmas.png")
	ammo_magazine = 16
	ammo_reserve -= ammo_to_reload


func _on_cooldown_timeout() -> void:
	can_shoot = true
