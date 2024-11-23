extends Control


@onready var anim_player = $AnimationPlayer
@onready var user_input1 = $"../Panels/DefinePanel2/DefineText/LineEdit"
@onready var user_input2 = $"../Panels/DefinePanel2/DefineText/LineEdit2"
@onready var target_pos = $"../TargetPos"
@onready var wrong_msg = $"../Panels/DefinePanel2/WrongMsg"


func _on_stop_point_body_entered(body):
	if body is Player:
		owner.player.controls_paused = true


func _on_submit_1_pressed():
	if user_input1.text.is_empty() or user_input2.text.is_empty():
		return
	
	if user_input1.text == "3" and user_input2.text == "number_of_gates":
		wrong_msg.hide()
		anim_player.play("open_gates")
		owner.current_score += 50 - (owner.current_used_hints * 10)
		USERDATA.player_game_data["level_2"][1] = owner.current_score
	else:
		wrong_msg.show()
		owner.current_mistakes += 1


func _on_animation_player_animation_finished(anim_name):
		owner.player.move_player = true
		owner.player.set_target_pos(target_pos.position, false)
