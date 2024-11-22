extends Control


@onready var ans1 = $"../Panels/Panel2/1"
@onready var ans2 = $"../Panels/Panel2/2"
@onready var ans3 = $"../Panels/Panel2/3"
@onready var target_pos1 = $"../TargetPos"
@onready var wrong_msg = $"../Panels/Panel2/WrongMsg"
var submitted = false


func _on_stop_point_body_entered(body):
	if body is Player:
		owner.player.controls_paused = true


func _on_submit_1_pressed():
	if submitted or ans1.get_child_count() == 0 or ans2.get_child_count() == 0 or ans3.get_child_count() == 0:
		return
	
	if ans1.get_child(0).name == "1" and ans2.get_child(0).name == "2" and ans3.get_child(0).name == "3":
		wrong_msg.hide()
		_animate_player()
		owner.current_score += 50 - (owner.current_used_hints * 10)
		USERDATA.player_game_data["level_1"][1] = 50 - (owner.current_used_hints * 10)
	else:
		wrong_msg.show()
		owner.current_mistakes += 1


func _animate_player():
	owner.player.move_player = true
	owner.player.set_target_pos(target_pos1.position, false)
