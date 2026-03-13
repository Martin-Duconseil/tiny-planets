extends Node2D

@export var planet_type = ""

var planet_hovered = false

func _ready():
	$Hover.visible = false
		
func _process(_delta):
	if planet_hovered:
		$Hover.visible = true
		Global.planet_name = planet_type
		if Input.is_action_just_pressed("left_click"):
			Global.planet_clicked = true
			Global.planet_clicked_type = planet_type
			$AnimationPlayer.play("pressed")
			Global.star_frag += 1
		else:
			Global.planet_clicked = false
			Global.planet_clicked_type = ""

func _on_area_2d_mouse_entered():
	planet_hovered = true

func _on_area_2d_mouse_exited():
	planet_hovered = false
	$Hover.visible = false
