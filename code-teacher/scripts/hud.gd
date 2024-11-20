extends CanvasLayer


func _ready():
	$AnimationPlayer.play("RESET")
	resume()


func _input(event):
	if event.is_action_pressed("esc") and !get_tree().paused:
		pause()
	elif event.is_action_pressed("esc") and get_tree().paused:
		resume()


func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")


func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")


func _on_restart_button_pressed():
	resume()
	get_tree().reload_current_scene()


func _on_resume_button_pressed():
	resume()


func _on_exit_button_pressed():
	await resume()
	var instance = owner.level_map.instantiate()
	get_tree().root.add_child(instance)
	get_tree().root.remove_child(get_tree().current_scene)
