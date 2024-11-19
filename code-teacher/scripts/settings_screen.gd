extends Control


@onready var popup_msg = $PopupMessage
@onready var reset_confirmation_panel = $ResetConfirmationPanel
@onready var sfx_on_box = $ScrollContainer/VBoxContainer/SoundControls/SfxControl/VBoxContainer/HBoxContainer/SfxOnButton
@onready var sfx_off_box = $ScrollContainer/VBoxContainer/SoundControls/SfxControl/VBoxContainer/HBoxContainer/SfxOffButton
@onready var music_on_box = $ScrollContainer/VBoxContainer/SoundControls/MusicControl/VBoxContainer/HBoxContainer/MusicOnButton
@onready var music_off_box = $ScrollContainer/VBoxContainer/SoundControls/MusicControl/VBoxContainer/HBoxContainer/MusicOffButton
@onready var game_hint_on_box = $ScrollContainer/VBoxContainer/GameHints/VBoxContainer/HBoxContainer/GameHintOnButton
@onready var game_hint_off_box = $ScrollContainer/VBoxContainer/GameHints/VBoxContainer/HBoxContainer/GameHintOffButton
@onready var completed_levels = $ScrollContainer/VBoxContainer/GameProgress/HBoxContainer/ScoreStatsContainer/LevelsFinished
@onready var avg_score = $ScrollContainer/VBoxContainer/GameProgress/HBoxContainer/ScoreStatsContainer/Score
@onready var avg_mistakes = $ScrollContainer/VBoxContainer/GameProgress/HBoxContainer/MistakesStatsContainer/Mistakes


func _ready():
	sfx_on_box.button_pressed = true
	sfx_off_box.button_pressed = false
	music_on_box.button_pressed = true
	music_off_box.button_pressed = false
	game_hint_on_box.button_pressed = true
	game_hint_off_box.button_pressed = false
	reset_confirmation_panel.hide()
	self.hide()


func _on_return_button_pressed():
	self.hide()


func _on_sound_control_button_pressed(button_name : String):
	match(button_name):
		"on_sfx":
			sfx_on_box.button_pressed = true
			sfx_off_box.button_pressed = false
		"off_sfx":
			sfx_on_box.button_pressed = false
			sfx_off_box.button_pressed = true
		"on_music":
			music_on_box.button_pressed = true
			music_off_box.button_pressed = false
		"off_music":
			music_on_box.button_pressed = false
			music_off_box.button_pressed = true
	
	GAMESETTINGS.is_sfx_enabled = sfx_on_box.button_pressed
	GAMESETTINGS.is_music_enabled = music_on_box.button_pressed


func _on_game_hint_button_pressed(button_name : String):
	match(button_name):
		"on_hint":
			game_hint_on_box.button_pressed = true
			game_hint_off_box.button_pressed = false
		"off_hint":
			game_hint_on_box.button_pressed = false
			game_hint_off_box.button_pressed = true
	
	GAMESETTINGS.is_game_hint_enabled = game_hint_on_box.button_pressed


func _on_reset_game_button_pressed():
	reset_confirmation_panel.show()


func _on_logout_button_pressed():
	USERDATA.save_player_data()
	USERDATA.clear_current_player_data()
	owner.login_screen.show()
	self.hide()


func _on_confirm_reset_button_pressed():
	reset_confirmation_panel.hide()
	USERDATA.reset_player_game_data()
	popup_msg.set_msg("Game Progress has been successfully reset!")


func _on_cancel_reset_button_pressed():
	reset_confirmation_panel.hide()


func update_game_progress():
	completed_levels.text = "1/1"
	avg_score.text = "100"
	avg_mistakes.text = "10"
