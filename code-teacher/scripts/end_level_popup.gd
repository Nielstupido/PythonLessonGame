extends CanvasLayer

const MISTAKES_LIMIT = 5
@onready var panel = $Panel
@onready var level_score = $LevelInfo/ScoreStatsContainer/Score
@onready var level_mistakes = $LevelInfo/MistakesStatsContainer/Mistakes
@onready var level_feedback = $LevelInfo/Feedback
@onready var level_title = $LevelInfo/LevelTitle
@onready var retry_button = $Panel/Retry
@onready var next_level_button = $Panel/NextLevel
var end_size = Vector2(0.1, 0.1)


func _ready():
	self.hide()


func prepare_level_popup():
	panel.scale = end_size
	
	if owner.level_data.level_number == 0:
		level_title.text = "Quiz Level " + owner.level_data.quiz_level_number
	else:
		level_title.text = "Level " + owner.level_data.level_number
	
	level_score.text = owner.current_score
	level_mistakes.text = owner.current_mistakes
	
	if owner.current_mistakes >= MISTAKES_LIMIT:
		level_feedback.text = "Unfortunately you reached the mistakes limit. Please try again."
		retry_button.show()
		next_level_button. hide()
	else:
		if owner.level_data.level_number == 0:
			level_feedback.text = "Congratulations on completing Quiz Level " + owner.level_data.quiz_level_number + "!"
		else:
			level_feedback.text = "Congratulations on completing Level " + owner.level_data.level_number + "!"
		
		next_level_button. show()
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
	await _on_close_pressed()
	get_tree().change_scene_to_packed(owner.NextLevel)
