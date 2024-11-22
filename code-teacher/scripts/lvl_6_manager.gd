extends Control


@onready var anim_player = $AnimationPlayer
@onready var ans1 = $"../Panels/Panel3/1"
@onready var ans2 = $"../Panels/Panel3/2"
@onready var ans3 = $"../Panels/Panel3/3"
@onready var target_pos1 = $"../TargetPos"
@onready var target_pos2 = $"../TargetPos2"
@onready var wrong_msg = $"../Panels/Panel3/WrongMsg"
var submitted = false


func _on_stop_point_body_entered(body):
	if body is Player:
		owner.player.controls_paused = true


func _on_submit_1_pressed():
	if submitted or ans1.get_child_count() == 0 or ans2.get_child_count() == 0 or ans3.get_child_count() == 0:
		return
	
	if ans1.get_child(0).name == "1" and ans2.get_child(0).name == "2" and ans3.get_child(0).name == "3":
		owner.player.connect("player_reached_target_pos", Callable(self, "_player_reached_target"))
		wrong_msg.hide()
		_animate_player()
		owner.current_score += 50 - (owner.current_used_hints * 10)
		USERDATA.player_game_data["level_1"][1] = 50 - (owner.current_used_hints * 10)
	else:
		wrong_msg.show()
		owner.current_mistakes += 1


func _animate_player():
	anim_player.play("open_gate")


func _player_reached_target():
	$AnimationPlayer.play("activate_bridge")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "open_gate":
		owner.player.move_player = true
		owner.player.set_target_pos(target_pos1.position, false)
	elif anim_name == "activate_bridge":
		owner.player.move_player = true
		owner.player.set_target_pos(target_pos2.position, false)
