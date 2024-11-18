extends Area2D
@export var Target: Player
@export var challenge_droppable: Droppable


func _process(delta):
	if challenge_droppable.is_right_answer == true:
		Target.active = true

func _on_body_entered(body):
	if body is Player:
		if challenge_droppable.is_right_answer == false:
			Target.velocity = Vector2.ZERO
			Target.active = false


func _on_body_exited(body):
	if body is Player:
		if challenge_droppable.is_right_answer == true:
			challenge_droppable.is_right_answer = false
			Target.active = true
