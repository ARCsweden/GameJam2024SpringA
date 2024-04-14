extends Control
var dig_depth_to_px_multiplier : int = 32

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	size.y = State.dig_depth * dig_depth_to_px_multiplier
	position.y = -State.dig_depth * dig_depth_to_px_multiplier
