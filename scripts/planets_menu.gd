extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.planet_description == "Jupiter":
		$Description.text = "Planet Info
							Jupiter
							20ft"
	if Global.planet_description == "Earth":
		$Description.text = "Planet Info
							Earth
							30ft"
