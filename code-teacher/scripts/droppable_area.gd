extends StaticBody2D
class_name Droppable
var target_is_in_place = false
var is_right_answer = false
@export var right_answer_directory: NodePath
@export var wrong_answer_directory: NodePath
@onready var collider = $Area2D # The child Area2D node. Mine's Area2D

func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)
	collider.connect("area_entered", _collide)

func _process(delta):
	if GLOBAL.is_dragging:
		visible = true
	else:
		visible = false

func _collide(collider2):
	if collider2.get_parent() == get_node(right_answer_directory) && GLOBAL.is_dragging == true:
		is_right_answer = true
		visible = true
		modulate = Color(Color.GREEN)
	#if collider2.get_parent() == get_node(wrong_answer_directory) && GLOBAL.is_dragging == true:
		#is_right_answer = false
		#visible = true
		#modulate = Color(Color.RED)
	else:
		is_right_answer = false
		visible = true
		modulate = Color(Color.RED)
	print(is_right_answer)
