extends Node

var digs : float = 0.0
var dig_depth: float = 0.0
var money: int = 0
var manpower: int = 0
var morale: float = 1.0

func add_money(amount: int):
	money += amount
	Signals.emit_signal("money_updated", amount)

func add_manpower(amount: int):
	manpower += amount
	Signals.emit_signal("manpower_updated", amount)

func add_morale(amount: int):
	morale += amount
	Signals.emit_signal("morale_updated", amount)
