extends Button

@export var level_data_copy : Resource
@onready var boxstyle = load("res://scenes/lvl_button_boxstyle.tres")
var original_size := scale
var grow_size := Vector2(1.1, 1.1)

#button color
var complete_level_color = Color8(75, 107, 37)
var uncomplete_level_color = Color8(122, 170, 65)
var locked_level_color = Color8(55, 52, 58)
#font color
var complete_level_font_color = Color8(110, 221, 17)
var uncomplete_level_font_color = Color8(52, 52, 52)
var locked_level_font_color = Color8(199, 199, 199)


func _ready():
	var new_boxstyle = boxstyle.duplicate()
	var level_number_str = "level_" + str(level_data_copy.level_number)
	
	if level_data_copy.level_number == 0:
		level_number_str = "quiz_level_" + str(level_data_copy.quiz_level_number)
	
	match (USERDATA.player_game_data[level_number_str][0]):
		"COMPLETED":
			new_boxstyle.bg_color = complete_level_color
			new_boxstyle.bg_color = complete_level_color
			add_theme_stylebox_override("normal", new_boxstyle)
			add_theme_stylebox_override("hover", new_boxstyle)
			add_theme_color_override("font_color", complete_level_font_color)
			add_theme_color_override("font_hover_color", complete_level_font_color)
			add_theme_color_override("font_focus_color", complete_level_font_color)
		"UNCOMPLETE":
			new_boxstyle.bg_color = uncomplete_level_color
			new_boxstyle.bg_color = uncomplete_level_color
			add_theme_stylebox_override("normal", new_boxstyle)
			add_theme_stylebox_override("hover", new_boxstyle)
			add_theme_color_override("font_color", uncomplete_level_font_color)
			add_theme_color_override("font_hover_color", uncomplete_level_font_color)
			add_theme_color_override("font_focus_color", uncomplete_level_font_color)
		"LOCKED":
			new_boxstyle.bg_color = locked_level_color
			new_boxstyle.bg_color = locked_level_color
			add_theme_stylebox_override("normal", new_boxstyle)
			add_theme_stylebox_override("hover", new_boxstyle)
			add_theme_color_override("font_color", locked_level_font_color)
			add_theme_color_override("font_hover_color", locked_level_font_color)
			add_theme_color_override("font_focus_color", locked_level_font_color)


func grow_button(end_size: Vector2, duration: float):
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", end_size, duration)


func _on_mouse_entered():
	grow_button(grow_size, .1)


func _on_mouse_exited():
	grow_button(original_size, .1)


func _on_pressed():
	owner.on_level_selected(level_data_copy)
