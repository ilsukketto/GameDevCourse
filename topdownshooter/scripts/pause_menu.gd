extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		visible = !visible
	
	if visible:
		get_parent().get_parent().process_mode = Node.PROCESS_MODE_DISABLED
	else:
		get_parent().get_parent().process_mode = Node.PROCESS_MODE_INHERIT


func _on_resume_button_pressed() -> void:
	visible = false


func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
