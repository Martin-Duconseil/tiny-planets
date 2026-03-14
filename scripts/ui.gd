extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Stars_label.text = "Star fragments: " + str(Global.star_frag)
	

func _on_buy_ship_pressed() -> void:
	pass # Replace with function body.
