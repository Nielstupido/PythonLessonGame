extends StaticBody2D
@export var Target: Draggable
@export var NonTarget: Draggable
@onready var collision = $CollisionShape2D
@export var boolean_type: bool
@export var integer_type: bool
@export var non_type : bool

func _process(delta):
	if non_type == true:
		return
	elif boolean_type == true:
		if Target.is_inside_droppable == true && GLOBAL.is_dragging == false:
			close_door()
		elif NonTarget != null && NonTarget.is_inside_droppable == true && GLOBAL.is_dragging == false:
			print("Wrong target")
		else:
			open_door()
	elif integer_type == true:
		if Target.is_inside_droppable == true && GLOBAL.is_dragging == false:
			open_door()
		elif NonTarget != null && NonTarget.is_inside_droppable == true && GLOBAL.is_dragging == false:
			print("Wrong target")
		else:
			close_door()

func open_door():
	collision.disabled = false
	visible = true

func close_door():
	collision.disabled = true
	visible = false
