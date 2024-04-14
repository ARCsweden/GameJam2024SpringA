#extends TextureRect
extends Node2D
var curr_depth = 0
var block_height : int
var texture = preload("res://icon.svg")
var smoothness = 100
func _ready():
	var sprite = Sprite2D.new()
	sprite.texture = texture
	block_height = sprite.get_rect().size[1]
	var w_height = get_viewport_rect().size[1]
	
	var n_rects = w_height/block_height
	for i in range(ceil(n_rects)):
		create_blob(0 ,i*block_height+0, Color.RED)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var depth_diff = int(State.dig_depth - curr_depth)
	if depth_diff > 0:
		for i in range(depth_diff):
			stepper(smoothness)
		curr_depth = State.dig_depth


func create_blob(x,y, color):
	var n = get_node("%moving") 
	var sprite = Sprite2D.new()
	sprite.texture = texture
	sprite.modulate = color
	sprite.position = Vector2(x,y)
	n.add_child(sprite)

var click = 0

func stepper(clicks_before_block):
	#randomize()
	var window_step = block_height/clicks_before_block
	var n = get_node("%moving")
	n.position.y-=window_step 
	if (click%clicks_before_block == 0):
		var col  = Color(randf(), randf(), randf())
		var screen_h = get_viewport_rect().size[1]
		var y_pos = screen_h+block_height*(click/clicks_before_block)+screen_h/11
		create_blob( 0, y_pos, col)
	click+=1
func _on_button_pressed():
	stepper(smoothness)
	var n = get_node("%moving")
	print(n.get_child_count())
	

