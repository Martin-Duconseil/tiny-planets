extends Node2D

var back_button_pressed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("escape") or back_button_pressed == true:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
