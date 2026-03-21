extends Button

@export var button_type = ""
var button_clicked = false
var timer: SceneTreeTimer = null

func _ready() -> void:
	text = "Buy ship"

func _process(_delta):
	if button_clicked:
		if button_type == "Buy_ship":
			button_clicked = false
			buy_ship()
	$Ship_price.text = "x" + str(Global.ship_price) + " star fragments"
			
func buy_ship():
	if Global.star_frag >= Global.ship_price:
		Global.star_frag -= Global.ship_price
		ship_spawning()
		text = "Ship bought!"
		Global.ship_price += randi_range(5,10)
	else:
		text = "Not enough star fragments"
	
	Global.hide_ship_price = true
	if timer:
		timer.time_left = 0
	timer = get_tree().create_timer(1)
	await timer.timeout
	text = "Buy ship"
	Global.hide_ship_price = false
	
func ship_spawning():
	get_tree().current_scene.spawned_ships.add_child(Global.ship_pool[0])
	Global.ship_pool[0].position = get_tree().current_scene.ship_spawn_location.global_position
	Global.ship_pool.append(Global.ship_pool[0])
	Global.ship_pool.pop_front()
	button_clicked = false


func _on_pressed() -> void:
	button_clicked = true
