extends MarginContainer

@onready var money: RichTextLabel = $ColorRect/HBoxContainer/Money/HBoxContainer/RichTextLabel
@onready var manpower: RichTextLabel = $ColorRect/HBoxContainer/Manpower/HBoxContainer/RichTextLabel
@onready var morale: RichTextLabel = $ColorRect/HBoxContainer/Morale/HBoxContainer/RichTextLabel

var stat_changed_ui: PackedScene = preload("res://Scenes/UI/stat_changed_ui.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("money_updated", on_money_updated)
	Signals.connect("manpower_updated", on_manpower_updated)
	Signals.connect("morale_updated", on_morale_updated)

func spawn_ui(value: int, offset_pos: Vector2):
	var diff: StatChangedUI = stat_changed_ui.instantiate()
	diff.value = value
	diff.position = offset_pos
	add_child(diff)

func on_money_updated(value: int):
	money.text = str(State.money)
	spawn_ui(value, Vector2(50, 0))

func on_manpower_updated(value: int):
	manpower.text = str(State.manpower)
	spawn_ui(value, Vector2(250, 0))

func on_morale_updated(value: int):
	morale.text = str(State.morale)
	spawn_ui(value, Vector2(450, 0))
