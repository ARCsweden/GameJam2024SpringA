extends PanelContainer
class_name EquipmentPanel

@export var res : Resource
@onready var texture = $MarginContainer/VBoxContainer/HBoxContainer/TextureRect
@onready var title = $MarginContainer/VBoxContainer/TitleLabel
@onready var dig_power_text = $MarginContainer/VBoxContainer/DigPowerLabel
@onready var cost_text = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/CostLabel
@onready var amount = $MarginContainer/VBoxContainer/AmountLabel
@onready var buyButton = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/BuyButton
# Called when the node enters the scene tree for the first time.
func _ready():
	texture.texture = res.icon
	title.text = res.title	
	dig_power_text.text = "Grävkraft: " + str(res.dig_power) + " spadtag/s" 
	cost_text.text  = str(res.cost) +"kr"
	amount.text = "Antal: " + str(res.amount)
	buyButton.connect("button_up",buy)

func buy():
	if State.money >= res.cost:
		res.amount += 1
		amount.text = "Antal: " + str(res.amount)
		State.money -= res.cost
		Signals.emit_signal("equipment_bought",res)
		Signals.emit_signal("money_updated",-res.cost)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if State.money < res.cost:
		buyButton.disabled = true
	else:
		buyButton.disabled = false

