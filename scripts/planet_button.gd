extends Node2D

@export var planet_type = ""

var planet_hovered = false
var planet_clicked = false

func _ready() -> void:
	pass

func _process(_delta):
	if planet_hovered:
		scale.x = 1.2
		scale.y = 1.2
		Global.planet_description = planet_type
		if Input.is_action_pressed("left_click"):
			planet_clicked = true
	else:
		scale.x = 1.0
		scale.y = 1.0
	
	if planet_clicked:
		Global.planet_switch = planet_type

func _on_area_2d_mouse_entered():
	planet_hovered = true

func _on_area_2d_mouse_exited():
	planet_hovered = false
