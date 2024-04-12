extends Sprite2D

@onready var spade: Sprite2D = $SpadeAnchor/Spade
@export var anim_amplitude = 10
@export var anim_speed = 1.0

var timer = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	spade.transform.origin = Vector2(0.0, sin(timer * anim_speed) * anim_amplitude)
