extends Label


func _can_drop_data(at_position, data):
	if data is DroppableAns and get_child_count() == 0:
		return true
	
	return false


func _drop_data(at_position, data):
	data.get_parent().remove_child(data)
	add_child(data)
	data.position.x = 0
	data.position.y = 0
