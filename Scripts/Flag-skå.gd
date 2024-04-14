extends Sprite2D

@onready var bar_length = get_node("%Bar").get_size().x
@onready var step  = 1/bar_length*1000
@onready var rate = step
var goal : int = 10 # meter
var start_position : Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position

func _process(delta):
	position = start_position + Vector2(bar_length*State.dig_depth/goal,0)
