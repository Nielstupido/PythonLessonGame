extends CanvasLayer


@onready var panel = $LevelInfo
@onready var level_title = $LevelInfo/VBoxContainer/LevelTitle
@onready var level_objectives_text = $LevelInfo/VBoxContainer/Objective
@onready var level_skills_text = $LevelInfo/VBoxContainer/SkillsPracticed
var end_size = Vector2(0.1, 0.1)


func prepare_level_popup():
	_show_level_info()
	panel.scale = end_size
	_show_panel()
	
	await get_tree().create_timer(5.0).timeout
	_on_close_pressed()


func _show_level_info():
	print("level data == " + str(owner.level_data_copy))
	level_title.text = owner.level_data_copy.level_title
	level_objectives_text.text = "Learning Objective : " + owner.level_data_copy.level_objectives
	level_skills_text.text = "Skills Practiced : " + owner.level_data_copy.level_skills
	
	var level_number_str = "level_"
	level_number_str += str(owner.level_data_copy.level_number)
	
	if owner.level_data_copy.level_number == 0:
		level_number_str = "quiz_level_" + str(owner.level_data_copy.quiz_level_number)


func _on_close_pressed():
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT_IN)
	await tween.tween_property(panel, "scale", end_size, 0.5).finished
	self.hide()


func _show_panel():
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(panel, "scale", Vector2(1.0, 1.0), 0.3)
