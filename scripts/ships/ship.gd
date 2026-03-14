extends CharacterBody2D
enum STATE{idle, moving, mining} 
var state
var speed:float = 3.5
var target_name:String = ""
var target_location:Vector2 = Vector2.ZERO
var target_index:int = 0
var food_count:int = 100

func _ready() -> void:
	Global.game_tick.connect(add_food)

func _process(_delta: float) -> void:
	if target_location != Vector2.ZERO:
		state = STATE.moving
		global_position.x = move_toward(global_position.x, get_tree().current_scene.planet_list[target_index].global_position.x, speed)
		global_position.y = move_toward(global_position.y, get_tree().current_scene.planet_list[target_index].global_position.y, speed)
		if global_position == target_location:
			target_location = Vector2.ZERO
			state = STATE.mining

func add_food():
	if target_name == "":
		return
	Global.planet_stats[target_name]["food"] += food_count
	
