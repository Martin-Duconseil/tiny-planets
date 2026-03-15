extends Node2D

var start_button_pressed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if start_button_pressed:
		get_tree().change_scene_to_file("res://scenes/map_scene.tscn")



func _on_start_button_pressed() -> void:
	start_button_pressed = true
