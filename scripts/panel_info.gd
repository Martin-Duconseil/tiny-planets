extends Node2D

func _ready() -> void:
	pass 


func _process(_delta: float) -> void:
	var food_label_planet = "food_level_" + Global.planet_name
	var population_label_planet = "population_level_" + Global.planet_name
	$Button.text = "Send ship to " + Global.planet_name
	$Planet_label.text = "Planet " + Global.planet_name
	$Food_label.text = "Food: " + str(Global.get(food_label_planet))
	$Population_label.text = "Population: " + str(Global.get(population_label_planet))
