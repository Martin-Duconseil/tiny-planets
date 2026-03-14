extends Node2D

@export var planet_type = ""
var rng:RandomNumberGenerator = RandomNumberGenerator.new()
var pop_increase_amount:int = 100

var planet_hovered = false

func _ready():
	Global.game_tick.connect(check_pop) ##add callable(func) to check total pop vs food count, if food > pop, pop increases. else decrease
	$Hover.visible = false
		
func check_pop():
	if Global.planet_stats[planet_type]["food"] > Global.planet_stats[planet_type]["pop"]:
		Global.planet_stats[planet_type]["pop"] += pop_increase_amount + randi_range(-20, 20)
		Global.planet_stats[planet_type]["food"] -= Global.planet_stats[planet_type]["pop"]
	else:
		var remove_pop = Global.planet_stats[planet_type]["pop"] /4
		Global.planet_stats[planet_type]["pop"] -= remove_pop
		
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
