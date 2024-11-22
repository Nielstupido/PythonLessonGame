extends Control

@onready var anim_player = $AnimationPlayer
@onready var first_input = $"../Panels/Panel6/1"
@onready var second_input = $"../Panels/Panel6/2"
@onready var first_target_pos = $"../TargetPos"
@onready var second_target_pos = $"../TargetPos2"
@onready var wrong_msg = $"../Panels/Panel6/Wrong"
var submitted = false


func _on_stop_point_body_entered(body):
	if body is Player:
		owner.player.controls_paused = true


func _on_button_pressed():
	if first_input.text.is_empty() or second_input.text.is_empty() or submitted:
		return
	
	if first_input.text == "2" and second_input.text == "3":
		owner.player.connect("player_reached_target_pos", Callable(self, "_player_reached_target"))
		anim_player.play("open_gates123")
		wrong_msg.hide()
		owner.current_score += 50 - (owner.current_used_hints * 10)
		USERDATA.player_game_data["level_4"][1] = 50 - (owner.current_used_hints * 10)
		submitted = true
	else:
		wrong_msg.show()
		owner.current_mistakes += 1


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "open_gates123":
		owner.player.move_player = true
		owner.player.set_target_pos(first_target_pos.position, false)
	elif anim_name == "open_gates456":
		owner.player.move_player = true
		owner.player.set_target_pos(second_target_pos.position, false)


func _player_reached_target():
	anim_player.play("open_gates456")
