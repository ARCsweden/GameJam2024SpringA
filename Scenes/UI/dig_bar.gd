extends MarginContainer

@onready var spadtag_label: RichTextLabel = $VBoxContainer/DigContainer/SpadtagLabel
@onready var djup_label: RichTextLabel = $VBoxContainer/DepthContainer/DjupLabel



func _process(delta):
	spadtag_label.text = str(floor(State.digs))
	var mm = floor(State.dig_depth * 1000.0)
	djup_label.text = str(mm) + " mm"

