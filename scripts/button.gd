extends Node2D

@export var button_type = ""

@export var texture_normal: Resource
@export var texture_hover: Resource
@export var texture_clicked: Resource

var button_hovered = false
var button_clicked = false

func _ready() -> void:
	pass

func _process(_delta):
	if button_hovered:
		$Texture.texture = texture_hover
		if Input.is_action_pressed("left_click"):
			$Texture.texture = texture_clicked
			button_clicked = true
			
	else:
		$Texture.texture = texture_normal
	if button_clicked:
		Global.menu_switch = button_type

func _on_area_2d_mouse_entered():
	button_hovered = true

func _on_area_2d_mouse_exited():
	button_hovered = false
