extends Control


@onready var lvl_challenge = $"../LvlChallenge"
@onready var first_holder = $"../LvlChallenge/Panel/PlaceHolder/1"
@onready var second_holder = $"../LvlChallenge/Panel/PlaceHolder/2"
@onready var third_holder = $"../LvlChallenge/Panel/PlaceHolder/3"
@onready var wrong_msg = $"../LvlChallenge/Panel/WrongMsg"
@onready var target_pos = $"../TargetPos"
var move_player = false


func _on_stop_point_body_entered(body):
	if body is Player:
		owner.player.controls_paused = true
		lvl_challenge.show()


func _on_submit_pressed():
	if first_holder.get_child_count() == 0 or second_holder.get_child_count() == 0 or third_holder.get_child_count() == 0:
		return
	
	if first_holder.get_child(0).name == "3" and second_holder.get_child(0).name == "1" and third_holder.get_child(0).name == "2":
		wrong_msg.hide()
		_animate_player()
		owner.current_score += 50 - (owner.current_used_hints * 10)
		USERDATA.player_game_data["level_1"][1] = 50 - (owner.current_used_hints * 10)
	else:
		wrong_msg.show()
		owner.current_mistakes += 1


func _animate_player():
	$AnimationPlayer.play("activate_bridge")


func _on_animation_player_animation_finished(anim_name):
	owner.player.move_player = true
	owner.player.set_target_pos(target_pos.position)


func _on_exit_body_entered(body):
	lvl_challenge.hide()
