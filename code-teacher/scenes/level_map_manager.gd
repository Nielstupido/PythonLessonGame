extends Control


@onready var level_information_panel = $LevelInfo
@onready var level_checkmamrk = $LevelInfo/Checkbox/Checkmark
@onready var level_title = $LevelInfo/VBoxContainer/LevelTitle
@onready var level_objectives_text = $LevelInfo/VBoxContainer/Objective
@onready var level_skills_text = $"LevelInfo/VBoxContainer/SkillsPracticed"
@onready var level_scores_text = $LevelInfo/ScoreStatsContainer/Score
@onready var level_mistakes_text = $LevelInfo/MistakesStatsContainer/Mistakes
@onready var play_button = $LevelInfo/VBoxContainer/PlayButton
@onready var replay_button = $LevelInfo/VBoxContainer/ReplayButton
@onready var completed_levels = $GameProgress/HBoxContainer/LevelStatsContainer/ProgressCircle/LevelsFinished
@onready var avg_mistakes = $GameProgress/HBoxContainer/MistakesStatsContainer/Mistakes
@onready var quiz1_checkmark = $GameProgress/HBoxContainer/Quiz1StatsContainer/Checkbox/Checkmark
@onready var quiz2_checkmark = $GameProgress/HBoxContainer/Quiz2StatsContainer/Checkbox/Checkmark
var current_active_level_data = null


func _ready():
	update_game_progress()
	level_information_panel.hide()
	var level_number_str


func on_level_selected(level_data):
	level_information_panel.show()
	current_active_level_data = level_data
	level_title.text = level_data.level_title
	level_objectives_text.text = "Learning Objective : " + level_data.level_objectives
	level_skills_text.text = "Skills Practiced : " + level_data.level_skills
	level_scores_text.text = "0"
	level_mistakes_text.text = "0"
	
	var level_number_str = "level_"
	level_number_str += str(level_data.level_number)
	
	if level_data.level_number == 0:
		level_number_str = "quiz_level_" + str(level_data.quiz_level_number)
	
	if USERDATA.player_game_data[level_number_str][0] == "COMPLETED":
		level_checkmamrk.show()
		replay_button.show()
		play_button.hide()
	else:
		level_checkmamrk.hide()
		replay_button.hide()
		play_button.show()


func update_game_progress():
	completed_levels.text = "1/1"
	avg_mistakes.text = "10"
	
	if USERDATA.player_game_data["quiz_level_1"][0] == "COMPLETED":
		quiz1_checkmark.show()
	else:
		quiz1_checkmark.hide()
	
	if USERDATA.player_game_data["quiz_level_2"][0] == "COMPLETED":
		quiz2_checkmark.show()
	else:
		quiz2_checkmark.hide()


func _on_play_button_pressed():
	get_tree().change_scene_to_packed(current_active_level_data.level_scene)


func _on_replay_button_pressed():
	get_tree().change_scene_to_packed(current_active_level_data.level_scene)
