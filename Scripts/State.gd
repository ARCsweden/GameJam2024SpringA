extends Node

var digs : float = 0.0
var dig_depth: float = 0.0
var money: int = 0
var manpower: int = 0
var morale: float = 0.0
var patreon_money : float = 0.0
var patreon_period : int = 10
var patreon_timer : float = 0.0
var dialog_active = true

func add_money(amount: int):
	money += amount
	Signals.emit_signal("money_updated", amount)

func add_manpower(amount: int):
	manpower += amount
	Signals.emit_signal("manpower_updated", amount)

func add_morale(amount: int):
	morale += amount
	Signals.emit_signal("morale_updated", amount)

func _process(delta):
	patreon_timer += delta
	if patreon_timer >= patreon_period:
		patreon_timer = 0
		add_money(patreon_money)
