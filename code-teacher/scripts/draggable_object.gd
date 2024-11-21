extends Node2D
class_name Draggable
var draggable = false
var is_inside_droppable = false
var body_ref
var offset: Vector2
var initialPos: Vector2


func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			GLOBAL.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			GLOBAL.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				print("will go to draggable")
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
			elif !is_inside_droppable:
				print("won't go to draggable")
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)


func _on_area_2d_mouse_entered():
	if GLOBAL.is_dragging == false:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if GLOBAL.is_dragging == false:
		draggable = false
		scale = Vector2(1, 1)


func _on_area_2d_area_entered(area):
	if area.is_in_group("droppable"):
		area = area
		is_inside_droppable = true
		area.modulate = Color(Color.REBECCA_PURPLE, 1)


func _on_area_2d_area_exited(area):
	if area.is_in_group("droppable"):
		is_inside_droppable = false
		area.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
