extends Button

@export var selected_level: PackedScene
var original_size := scale
var grow_size := Vector2(1.1, 1.1)


func grow_button(end_size: Vector2, duration: float):
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", end_size, duration)

func _on_mouse_entered():
	grow_button(grow_size, .1)


func _on_mouse_exited():
	grow_button(original_size, .1)


func _on_pressed():
	get_tree().change_scene_to_packed(selected_level)
