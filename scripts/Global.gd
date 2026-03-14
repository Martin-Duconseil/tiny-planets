extends Node
signal game_tick

var menu_switch:String = ""
var planet_clicked:bool = false
var planet_clicked_type:String = ""
var planet_switch:String = ""
var planet_name:String = ""
var food_level:int = 0

# Galileo stats
var food_level_Galileo:int = 0
var population_level_Galileo:int = 15

# Archaeus stats
var food_level_Archaeus:int = 0
var population_level_Archaeus:int = 15

# Juniel stats
var food_level_Juniel:int = 0
var population_level_Juniel:int = 15

# Orion stats
var food_level_Orion:int = 0
var population_level_Orion:int = 15


var total_points:int = 0
var ship_pool:Array
var save_path:String = "user://tiny-planets.json"

var total_ships:int = 10
var population:int
var star_frag:int
var game_data:Dictionary = {
	"total_points":total_points,
	"population":population,
	"star_frag":star_frag,
	"total_ships":total_ships
	
}

const SHIP = preload("uid://cj2xtofpv1c4v")
var ship:Node

func _ready() -> void:
	load_ship_pool()

func load_ship_pool():
	for s in total_ships:
		ship = SHIP.instantiate()
		ship_pool.append(ship)

func save_game():
	var save_data:Dictionary = {
		##Add anything here you want to save, can be more dicts or single values
		"game_data":game_data#can keep adding dict entries for more data without changing this, load will need some data
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
	population = data.get("population")
	star_frag = data.get("star_frag")
	total_ships = data.get("total_ships")
	total_points = data.get("total_points")
	
	
