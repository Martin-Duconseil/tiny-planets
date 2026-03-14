extends Node2D
@onready var spawned_ships: Node2D = $SpawnedShips
@onready var ship_spawn_location: Marker2D = $ShipSpawnLocation

@onready var galileo: Node2D = $Planet_galileo
@onready var archaeus: Node2D = $Planet_archaeus
@onready var juniel: Node2D = $Planet_juniel
@onready var orion: Node2D = $Planet_orion
var planet_list:Array
var tick:int
var tick_time = 800

func _ready() -> void:
	planet_list = [
		galileo,
		archaeus,
		juniel,
		orion
	]
	
func _process(delta: float) -> void:
	game_ticks()
	
func game_ticks():
	tick += 1
	if tick >= tick_time:
		tick = 0
		Global.game_tick.emit()
		print("tick")
