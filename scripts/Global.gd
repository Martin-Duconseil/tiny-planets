extends Node

var menu_switch:String = ""
var planet_clicked:bool = false
var planet_clicked_type:String = ""
var planet_switch:String = ""
var planet_description:String = ""
var total_points:int = 0
var total_ships:int = 10
var ship_pool:Array
var rng = RandomNumberGenerator.new()
var save_path:String = "user://tiny-planets.json"
const SHIP = preload("uid://cj2xtofpv1c4v")
var ship:Node

func load_ship_pool():
	
	for s in total_ships:
		ship = SHIP.instantiate()
		get_tree().current_scene.add_child.call_deferred(ship)
		ship.position = Vector2i(rng.randi_range(-100, 100,), rng.randi_range(-100, 100))
		ship_pool.append(ship)

func save_game():
	var save_data:Dictionary = {
		##Add anything here you want to save, can be more dicts or single values
	}
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file == null:
		push_error("failed write")
		return
	file.store_var(save_data)
	file.close()
	#converts whatever is in the save_data dict to text
	
func load_game():
	if !FileAccess.file_exists(save_path):
		print("no file")
		return 
	var file = FileAccess.open(save_path, FileAccess.READ)
	var text = file.get_var()
	file.close()
	var data:Dictionary = (text)
	if !typeof(data) == TYPE_DICTIONARY:
		push_error("invalid save data")
		return 
	 
	#Clear dicts and any other values you want to reset with this code: life = data.get("life")
	#or better example: total_points = data.get("total_points")
	
