extends Control

@onready var temp_button: Button = $TempButton

var time_to_next_event = 10.0

var rng = RandomNumberGenerator.new()

var dialog_res = load("res://Assets/Dialogues/events.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready():
	temp_button.connect("pressed", on_temp_button_pressed)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
	DialogueManager.show_example_dialogue_balloon(dialog_res, "start_dialogue")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not State.dialog_active:
		time_to_next_event -= delta
		if time_to_next_event <= 0.0:
			time_to_next_event = rng.randf_range(10.0, 20.0)
			State.dialog_active = true
			DialogueManager.show_example_dialogue_balloon(dialog_res, "random_event")

func on_temp_button_pressed():
	Signals.emit_signal("dig")

func _on_dialogue_ended(_dialog):
	State.dialog_active = false
