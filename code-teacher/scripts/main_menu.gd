extends Control

@onready var settings_screen = $SettingsScreen
var level_map_scene = preload("res://scenes/level_select_screen.tscn")


func _ready():
	settings_screen.hide()


func _on_start_button_pressed():
	get_tree().change_scene_to_packed(level_map_scene)


func _on_settings_button_pressed():
	settings_screen.show()


func _on_exit_button_pressed():
	get_tree().quit()
