extends PanelContainer

@export var res : Resource
@onready var texture = $MarginContainer/VBoxContainer/HBoxContainer/TextureRect
@onready var title = $MarginContainer/VBoxContainer/TitleLabel
@onready var dig_power_text = $MarginContainer/VBoxContainer/DigPowerLabel
@onready var cost_text = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/CostLabel
@onready var amount = $MarginContainer/VBoxContainer/AmountLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	texture.texture = res.icon
	title.text = res.title	
	dig_power_text.text = "Grävkraft: " + str(res.dig_power) + " spadtag/s" 
	cost_text.text  = str(res.cost) +"kr"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
