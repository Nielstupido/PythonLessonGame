extends Control


@onready var first_ans = $"../Panels/IfPanel/1"
@onready var second_ans = $"../Panels/ElsePanel/2"
@onready var third_ans = $"../Panels/ElsePanel/3"
@onready var wrong_msg1 = $"../Panels/IfPanel/WrongMsg"
@onready var wrong_msg2 = $"../Panels/ElsePanel/WrongMsg"
@onready var anim_player = $AnimationPlayer
var submit_done1 = false
var submit_done2 = false


func _on_submit_1_pressed():
	if first_ans.get_child_count() == 0 or submit_done1:
		return
	
	if first_ans.get_child(0).name == "True":
		wrong_msg1.hide()
		owner.current_score += 50 - (owner.current_used_hints * 10)
		anim_player.play("open_door")
		submit_done1 = true
	else:
		wrong_msg1.show()
		owner.current_mistakes += 1


func _on_submit_2_pressed():
	if second_ans.get_child_count() == 0 or third_ans.get_child_count() == 0 or submit_done2:
		return
	
	if second_ans.get_child(0).name == "True" and third_ans.get_child(0).name == "False":
		wrong_msg2.hide()
		owner.current_score += 50 - (owner.current_used_hints * 10)
		USERDATA.player_game_data["level_3"][1] = owner.current_score
		anim_player.play("activate_bridge")
		submit_done2 = true
	else:
		wrong_msg2.show()
		owner.current_mistakes += 1
