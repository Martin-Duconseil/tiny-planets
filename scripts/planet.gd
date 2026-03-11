extends Node2D

@export var planet_type = ""
@onready var camera: Camera2D = $Camera

var planet_hovered = false

func _ready():
	$Hover.visible = false
	if get_tree().current_scene.name == "map_scene":
		camera.enabled = false
	else: Global.load_ship_pool()

		

func _process(_delta):
	if planet_hovered:
		$Hover.visible = true
		Global.planet_description = planet_type
		if Input.is_action_just_pressed("left_click"):
			Global.planet_clicked = true
			Global.planet_clicked_type = planet_type
			get_tree().change_scene_to_file("res://scenes/planet_" + planet_type.to_lower() + ".tscn")
		else:
			Global.planet_clicked = false
			Global.planet_clicked_type = ""

func _on_area_2d_mouse_entered():
	planet_hovered = true

func _on_area_2d_mouse_exited():
	planet_hovered = false
	$Hover.visible = false
