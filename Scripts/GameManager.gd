extends Node

var equipment : Dictionary = {}
var distace : int = 150000 # in meter
var digs_per_meter : int = 10 #digs for one dm down
var depth_per_dig : float = 0.1 # m
var digs_to_depth_multiplier = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set up starting resources
	State.add_money(100)
	State.add_manpower(1)
	State.add_morale(100)
	Signals.connect("equipment_bought",update_equipment)
	Signals.connect("dig",dig_once)
	digs_to_depth_multiplier = 1 / (distace * digs_per_meter / depth_per_dig)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not State.dialog_active:
		for eqIndex in equipment:
			var eq : EquipmentResource = equipment[eqIndex]
			State.digs += eq.amount * eq.dig_power * manpower_multiply(State.manpower) * (State.morale/100) * delta 
			
	State.dig_depth  = digs_to_depth_multiplier * State.digs

func manpower_multiply(manpower : int):
	return 1 + tanh(float(manpower)/1000)
	
func update_equipment(res : EquipmentResource):
	equipment[res.title] = res

func dig_once():
	State.digs += 1
