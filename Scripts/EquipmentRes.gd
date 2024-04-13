extends Resource
class_name EquipmentResource

@export var icon : Texture2D
@export var title : String
@export var cost : int
@export var dig_power : float
@export var amount : int
func _init(p_icon = Texture2D.new(), p_title = "Equipment", p_cost = 100, p_dig_power = 1.0, p_amount = 0):
	icon = p_icon
	title = p_title
	cost = p_cost
	dig_power = p_dig_power
	amount = p_amount
	
 
