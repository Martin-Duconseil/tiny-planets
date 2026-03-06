extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	$Total_points.text = "Total points: " + str(Global.total_points)
	
	
	if Global.planet_clicked == true:
		Global.total_points += 1
