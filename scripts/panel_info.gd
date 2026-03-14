extends Node2D
var ship_index:int = 0

func _ready() -> void:
	pass 


func _process(_delta: float) -> void:
	if Global.planet_name == "":#if no planet selected return null
		return
	$GoToButton.text = "Send ship to " + Global.planet_name
	$Planet_label.text = "Planet " + Global.planet_name
	$Food_label.text = "Food: " + str(Global.planet_stats[Global.planet_name]["food"])
	$Population_label.text = "Population: " + str(Global.planet_stats[Global.planet_name]["pop"])


func _on_go_to_button_pressed() -> void:
	if get_tree().current_scene.spawned_ships.get_child_count() == 0:
		return#if no ships are spawned return null
	var current_ship:Node = get_tree().current_scene.spawned_ships.get_child(ship_index)
	var pname:String = Global.planet_name
	var index:int = 0
	for p in get_tree().current_scene.planet_list.size() - 1:#match planet_list with planted name
		if pname == get_tree().current_scene.planet_list[index].planet_type:
			break
		index += 1
			
	var targeted_location:Vector2 = Vector2(get_tree().current_scene.planet_list[index].global_position.x, get_tree().current_scene.planet_list[index].global_position.y)
	current_ship.target_index = index
	current_ship.target_location = targeted_location#send index of planet and target to ship
	current_ship.target_name = pname
	ship_index += 1
	if get_tree().current_scene.spawned_ships.get_child_count() <= ship_index:
		ship_index = 0
	
