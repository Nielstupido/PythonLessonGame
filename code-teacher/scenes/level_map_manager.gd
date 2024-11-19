extends Control


@export var level_buttons : Array[Node] = []
@onready var level_information_panel = $LevelInfo
@onready var level_title = $LevelInfo/VBoxContainer/LevelTitle
@onready var level_objectives_text = $LevelInfo/VBoxContainer/Objective
@onready var level_skills_text = $"LevelInfo/VBoxContainer/SkillsPracticed"
@onready var level_scores_text = $LevelInfo/ScoreStatsContainer/Score
@onready var level_mistakes_text = $LevelInfo/MistakesStatsContainer/Mistakes
@onready var play_button = $LevelInfo/VBoxContainer/PlayButton
@onready var replay_button = $LevelInfo/VBoxContainer/ReplayButton
var current_active_level_data = null


func _ready():
	level_information_panel.hide()
	var level_number_str
	#
	#for btn in level_buttons:
		#level_number_str = "level_" + str(btn.level_data.level_number)
		#
		#if btn.level_data.level_number == 0:
			#level_number_str = "quiz_level_" + str(btn.level_data.quiz_level_number)
		#
		#match (USERDATA.player_game_data[level_number_str][0]):
			#"COMPLETED":
				#btn.get_theme_stylebox("normal").bg_color = btn.complete_level_color
				#btn.get_theme_stylebox("hover").bg_color = btn.complete_level_color
				#btn.add_theme_color_override("font_color", btn.complete_level_font_color)
				#btn.add_theme_color_override("font_focus_color", btn.complete_level_font_color)
			#"UNCOMPLETE":
				#btn.get_theme_stylebox("normal").bg_color = btn.uncomplete_level_color
				#btn.get_theme_stylebox("hover").bg_color = btn.uncomplete_level_color
				#btn.add_theme_color_override("font_color", btn.uncomplete_level_font_color)
				#btn.add_theme_color_override("font_focus_color", btn.uncomplete_level_font_color)
			#"LOCKED":
				#btn.get_theme_stylebox("normal").bg_color = btn.locked_level_color
				#btn.get_theme_stylebox("hover").bg_color = btn.locked_level_color
				#btn.add_theme_color_override("font_color", btn.locked_level_font_color)
				#btn.add_theme_color_override("font_focus_color", btn.locked_level_font_color)


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
		replay_button.show()
	else:
		play_button.show()


func _on_play_button_pressed():
	get_tree().change_scene_to_packed(current_active_level_data.level_scene)


func _on_replay_button_pressed():
	get_tree().change_scene_to_packed(current_active_level_data.level_scene)
