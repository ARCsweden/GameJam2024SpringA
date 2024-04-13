extends MarginContainer
class_name StatChangedUI

@export var value: int = 1
@export var lifetime: float = 2
@export var decay_dist: float = 10.0

@onready var label: RichTextLabel = $RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	var color = Color(1.0, 0.0, 0.0, 1.0) # RED
	if value > 0:
		color = Color(0.0, 1.0, 0.0, 1.0) # GREEN
	modulate = color
	color.a = 0.0 # animate to transparent
	var tween = get_tree().create_tween()
	var rand_dir = randf() * 2 * PI
	var final_pos = Vector2(cos(rand_dir), sin(rand_dir)) * decay_dist
	tween.parallel().tween_property(label, "modulate", color, lifetime)
	tween.parallel().tween_property(label, "position", final_pos, lifetime)
	tween.tween_callback(queue_free) # Delete the object after done animating
