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
var random_val = 0.0
var random_int = 0

func add_money(amount: int):
	amount = floor(amount)
	money += amount
	if money < 0:
		money = 0
	Signals.emit_signal("money_updated", amount)

func add_manpower(amount: int):
	amount = floor(amount)
	manpower += amount
	if manpower < 0:
		manpower = 0
	Signals.emit_signal("manpower_updated", amount)

func add_morale(amount: int):
	amount = floor(amount)
	morale += amount
	if morale < 0:
		morale = 0
	Signals.emit_signal("morale_updated", amount)

func add_patreon(amount: int):
	amount = floor(amount)
	patreon_money += amount
	if patreon_money < 0:
		patreon_money = 0
	Signals.emit_signal("patreon_updated", amount)

func _process(delta):
	patreon_timer += delta
	if patreon_timer >= patreon_period:
		patreon_timer = 0
		add_money(patreon_money)

func get_random():
	random_val = randf()

func get_random_int(range: int):
	random_int = randi() % range

