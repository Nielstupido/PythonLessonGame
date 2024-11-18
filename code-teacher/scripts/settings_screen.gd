extends Control


@onready var sfx_on_box = $VBoxContainer/SoundControls/SfxControl/VBoxContainer/HBoxContainer/SfxOnButton
@onready var sfx_off_box = $VBoxContainer/SoundControls/SfxControl/VBoxContainer/HBoxContainer/SfxOffButton
@onready var music_on_box = $VBoxContainer/SoundControls/MusicControl/VBoxContainer/HBoxContainer/MusicOnButton
@onready var music_off_box = $VBoxContainer/SoundControls/MusicControl/VBoxContainer/HBoxContainer/MusicOffButton
@onready var game_hint_on_box = $VBoxContainer/GameHints/VBoxContainer/HBoxContainer/GameHintOnButton
@onready var game_hint_off_box = $VBoxContainer/GameHints/VBoxContainer/HBoxContainer/GameHintOffButton


func _ready():
	sfx_on_box.button_pressed = true
	sfx_off_box.button_pressed = false
	music_on_box.button_pressed = true
	music_off_box.button_pressed = false
	game_hint_on_box.button_pressed = true
	game_hint_off_box.button_pressed = false


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
	USERDATA.reset_player_game_data()
