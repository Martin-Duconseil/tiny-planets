extends Button

@export var button_type = ""
var button_clicked = false

func _ready() -> void:
	pass

func _process(_delta):

	if button_clicked:
		if button_type == "Add_population":
			add_population()
			
func add_population():
	var planet = Global.planet_stats.get(Global.planet_name)
	if planet:
		planet["pop"] += 20
	
	
	button_clicked = false

	

func _on_pressed() -> void:
	button_clicked = true
