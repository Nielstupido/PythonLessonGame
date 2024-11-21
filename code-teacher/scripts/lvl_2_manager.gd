extends Control


@onready var user_input = $"../Panel2/Label2/LineEdit"
@onready var target_pos = $"../FirstTargetPos"
@onready var wrong_msg = $"../Panel2/WrongMsg"


func _on_stop_point_body_entered(body):
	if body is Player:
		owner.player.controls_paused = true


func _on_submit_pressed():
	if user_input.text == "2":
		wrong_msg.hide()
		owner.current_score += 50 - (owner.current_used_hints * 10)
		USERDATA.player_game_data["level_2"][1] = owner.current_score
		owner.player.move_player = true
		owner.player.set_target_pos(target_pos.position, false)
	else:
		wrong_msg.show()
		owner.current_mistakes += 1
