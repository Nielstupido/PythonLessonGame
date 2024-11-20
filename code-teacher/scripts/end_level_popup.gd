extends CanvasLayer

const MISTAKES_LIMIT = 5
@onready var panel = $Panel
@onready var level_score = $LevelInfo/ScoreStatsContainer/Score
@onready var level_mistakes = $LevelInfo/MistakesStatsContainer/Mistakes
@onready var level_feedback = $LevelInfo/Feedback
@onready var level_title = $LevelInfo/LevelTitle
@onready var retry_button = $Panel/Retry
@onready var next_level_button = $Panel/NextLevel
@onready var level_map_button = $Panel/LevelMap
var end_size = Vector2(0.1, 0.1)


func _ready():
	self.hide()


func prepare_level_popup():
	panel.scale = end_size
	_save_player_data("Uncomplete")
	
	if owner.level_data.level_number == 0:
		level_title.text = "Quiz Level " + owner.level_data.quiz_level_number
	else:
		level_title.text = "Level " + owner.level_data.level_number
	
	level_score.text = owner.current_score
	level_mistakes.text = owner.current_mistakes
	
	if owner.current_mistakes >= MISTAKES_LIMIT:
		level_feedback.text = "Unfortunately you reached the mistakes limit. Please try again."
		retry_button.show()
		next_level_button.hide()
		level_map_button.hide()
	else:
		if owner.level_data.level_number == 0:
			level_feedback.text = "Congratulations on completing Quiz Level " + owner.level_data.quiz_level_number + "!"
		else:
			level_feedback.text = "Congratulations on completing Level " + owner.level_data.level_number + "!"
		
		next_level_button.show()
		retry_button.hide()
		level_map_button.hide()
	
	if owner.level_data.quiz_level_number == 2:
		level_map_button.show()
		next_level_button.hide()
		retry_button.hide()
	
	_show_panel()


func _show_panel():
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(panel, "scale", Vector2(1.0, 1.0), 0.3)


func _on_close_pressed():
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT_IN)
	await tween.tween_property(panel, "scale", end_size, 0.5).finished
	self.hide()


func _on_retry_pressed():
	await _on_close_pressed()
	get_tree().reload_current_scene()


func _on_next_level_pressed():
	_save_player_data("Complete")
	await _on_close_pressed()
	get_tree().change_scene_to_packed(owner.NextLevel) ## proceed to next level


func _on_level_map_pressed():
	_save_player_data("Complete")
	await _on_close_pressed()
	get_tree().change_scene_to_packed(owner.level_map) ## all levels are finished


func _save_player_data(status):
	var level_number_str = "level_"
	var next_level_number_str = "level_"
	level_number_str += str(owner.level_data.level_number)
	
	if status == "Complete":
		next_level_number_str += str(owner.level_data.level_number + 1)
		
		if owner.level_data == 5:
			next_level_number_str = "quiz_level_1"
		elif owner.level_data == 10:
			next_level_number_str = "quiz_level_2"
	
	if owner.level_data.level_number == 0:
		level_number_str = "quiz_level_" + str(owner.level_data.quiz_level_number)
		
		if status == "Complete" and owner.quiz_level_number == 1:
			next_level_number_str = "level_6"
	
	USERDATA.player_game_data[level_number_str][0] = "COMPLETED"
	USERDATA.player_game_data[level_number_str][1] = owner.current_score
	USERDATA.player_game_data[level_number_str][2] = owner.current_mistakes
	
	if status == "Complete" and owner.level_data.quiz_level_number != 2:
		USERDATA.player_game_data[next_level_number_str][0] = "UNCOMPLETE"
	
	USERDATA.save_player_data()
