extends Node
var equipment : Dictionary = {}
var distace : int = 150000 # in meter
var digs_per_meter : int = 10 #digs for one dm down
var depth_per_dig : float = 0.1 # m
var digs_to_depth_multiplier = 0
var resource = load("res://Assets/Dialogues/test.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready():
	State.money = 500
	Signals.connect("equipment_bought",update_equipment)
	Signals.connect("dig",dig_once)
	digs_to_depth_multiplier = 1/(distace*digs_per_meter / depth_per_dig)
	start_dialog()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for eqIndex in equipment:
		var eq : EquipmentResource = equipment[eqIndex]
		State.digs += eq.amount * eq.dig_power * delta
	State.dig_depth  = digs_to_depth_multiplier * State.digs

		 
func update_equipment(res : EquipmentResource):
	equipment[res.title] = res
func dig_once():
	State.digs += 1
	
func start_dialog():
	pass
