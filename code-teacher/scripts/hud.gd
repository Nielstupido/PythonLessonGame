extends Control
var initial_position
@export var player : Player

func _ready():
	$AnimationPlayer.play("RESET")
	initial_position = global_position

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
	get_tree().quit()

func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		global_position = player.global_position - Vector2(0, 50)
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		global_position = initial_position
		resume()

func _process(delta):
	testEsc()
