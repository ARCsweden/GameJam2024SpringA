extends MarginContainer

@onready var spadtag_label: RichTextLabel = $VBoxContainer/DigContainer/SpadtagLabel
@onready var djup_label: RichTextLabel = $VBoxContainer/DepthContainer/DjupLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("dig", on_dig)

func on_dig():
	spadtag_label.text = str(State.digs)
	var mm = floor(State.dig_depth * 1000.0)
	djup_label.text = str(mm) + " mm"
