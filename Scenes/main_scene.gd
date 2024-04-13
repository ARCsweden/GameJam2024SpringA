extends Control

@onready var temp_button: Button = $TempButton

# Called when the node enters the scene tree for the first time.
func _ready():
	temp_button.connect("pressed", on_temp_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_temp_button_pressed():
	Signals.emit_signal("dig")