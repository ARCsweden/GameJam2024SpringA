extends MarginContainer

@onready var money: RichTextLabel = $ColorRect/HBoxContainer/Money/HBoxContainer/RichTextLabel
@onready var manpower: RichTextLabel = $ColorRect/HBoxContainer/Manpower/HBoxContainer/RichTextLabel
@onready var morale: RichTextLabel = $ColorRect/HBoxContainer/Morale/HBoxContainer/RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("money_updated", on_money_updated)
	Signals.connect("money_updated", on_money_updated)
	Signals.connect("money_updated", on_money_updated)

func on_money_updated(value: int):
	money.text = str(State.money)

func on_manpower_updated(value: int):
	manpower.text = str(State.manpower)

func on_morale_updated(value: int):
	morale.text = str(State.morale)
