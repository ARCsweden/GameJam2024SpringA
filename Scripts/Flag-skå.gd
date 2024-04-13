extends Sprite2D
@onready var bar_length = get_node("%Bar").get_size().x
@onready var step  = 1/bar_length*1000
@onready var rate = step
# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("dig", on_dig)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_dig():
	rate = step/2
	position += Vector2(step,0)
	position.x
	print(step)
