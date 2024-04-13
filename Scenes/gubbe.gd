extends Sprite2D

@export var anim_speed = 1.0
@onready var anim_player: AnimationPlayer = $AnimationPlayer

var timer = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("dig", on_dig)
	anim_player.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_dig():
	anim_player.play("dig", -1, anim_speed)
	anim_player.queue("idle")
