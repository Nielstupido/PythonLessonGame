extends Node2D
@onready var normal = $NormalSprite
@onready var focused = $FocusedSprite

func _ready():
	normal.visible = true
	focused.visible = false

func _process(delta):
	global_position = get_global_mouse_position()

func _physics_process(delta):
	if Input.is_action_just_pressed("control_reaper"):
		focused.visible = true
		normal.visible = false
	if Input.is_action_just_pressed("select_reaper_teleport_position"):
		focused.visible = false
		normal.visible = true
