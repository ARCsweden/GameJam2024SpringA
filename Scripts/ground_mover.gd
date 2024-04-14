#extends TextureRect
extends Node2D
var curr_depth = 0

func make_objects(x, y):
	var sprite = Sprite2D.new()
	sprite.texture = preload("res://icon.svg")
	var o_height = sprite.get_rect().size[1]
	var w_height = get_viewport_rect().size[1]
	var n_rects = w_height/o_height
	for i in range(ceil(n_rects)):
		sprite = Sprite2D.new()
		sprite.texture = preload("res://icon.svg")
		
		sprite.position.y += i*o_height+y
		sprite.position.x = x
		if i%2:
			sprite.modulate = Color.RED
		self.add_child(sprite)
func make_rows(n, y):
	for i in range(n):
		make_objects(120*i, y)
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var sprite = Sprite2D.new()
	sprite.texture = preload("res://icon.svg")
	var o_height = sprite.get_rect().size[1]
	var w_height = get_viewport_rect().size[1]
	var n_rects = w_height/o_height
	for i in range(ceil(n_rects)):
		sprite = Sprite2D.new()
		sprite.texture = preload("res://icon.svg")
		
		sprite.position.y += i*o_height+0
		sprite.position.x = 0
		if i%2:
			sprite.modulate = Color.RED
		self.add_child(sprite)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var depth_diff = int(State.dig_depth - curr_depth)
	if depth_diff > 0:
		for i in range(depth_diff):
			stepper()
		curr_depth = State.dig_depth


func create_blob(x,y, color):
	var n = get_node("%moving") 
	var sprite = Sprite2D.new()
	sprite.texture = preload("res://icon.svg")
	sprite.modulate = color
	sprite.position = Vector2(x,y)
	n.add_child(sprite)

var click = 0
func stepper():
	#randomize()
	var n = get_node("%moving")
	var dist = -120
	n.position.y+=dist 
	var spy = -1*click*dist
	var col  = Color(randf(), randf(), randf())
	
	create_blob( 0,
	get_viewport_rect().size[1]-dist*(click)+90,
	col)
	click+=1
func _on_button_pressed():
	stepper()

