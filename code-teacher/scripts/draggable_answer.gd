extends Label
class_name DroppableAns


func _get_drag_data(at_position):
	var data = 1
	var prev = Label.new()
	prev.label_settings = self.label_settings
	prev.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	prev.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	prev.size = self.size
	prev.text = self.text
	prev.add_theme_stylebox_override("normal", self.get_theme_stylebox("normal"))
	set_drag_preview(prev)
	
	return self
