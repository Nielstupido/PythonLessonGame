extends Node
@export var NextLevel: PackedScene
@export var level_data : Resource
@export var level_name: String
@export var level_num : float
@onready var player = $Player
@onready var pause_menu = $PauseMenu
var collected_coins := 0

func _ready():
	if level_num <= 2.0:
		player.boy_sprite.visible = false
		player.female_sprite.visible = false
		player.girl_sprite.visible = true
		player.male_sprite.visible = false
	elif level_num <= 5.0:
		player.girl_sprite.visible = false
		player.female_sprite.visible = false
		player.boy_sprite.visible = true
		player.male_sprite.visible = false
	elif level_num >= 10.0:
		player.girl_sprite.visible = false
		player.boy_sprite.visible = false
		player.female_sprite.visible = false
		player.male_sprite.visible = true
	elif level_num >= 6.0:
		player.girl_sprite.visible = false
		player.boy_sprite.visible = false
		player.male_sprite.visible = false
		player.female_sprite.visible = true
	
func _process(delta):
	if level_name == "level1":
		pass
	if level_name == "level4":
		if $"Panels/Panel6/Droppable Area".is_right_answer == true and $"Panels/Panel6/Droppable Area2".is_right_answer == true:
			$Panels/Panel6/Door.close_door()
		elif $"Panels/Panel6/Droppable Area".is_right_answer == false and $"Panels/Panel6/Droppable Area2".is_right_answer == false:
			$Panels/Panel6/Door.open_door()
	
	if level_name == "level5":
		if $"first challenge/Droppable Area".is_right_answer == true:
			$"first challenge/Door1".close_door()
		else:
			$"first challenge/Door1".open_door()
		
		if $"second challenge/Droppable Area2".is_right_answer == true and $"second challenge/Droppable Area".is_right_answer == true:
			$"second challenge/Door2".close_door()
		else:
			$"second challenge/Door2".open_door()
	
	if level_name == "quiz_level1":
		if $"first challenge/Droppable Area".is_right_answer == true and $"first challenge/Droppable Area2".is_right_answer == true and $"first challenge/Droppable Area3".is_right_answer == true:
			$"first challenge/Door".close_door()
		else:
			$"first challenge/Door".open_door()
	
	if level_name == "level7":
		if $"Panels/Panel4/Droppable Area".is_right_answer == true and $"Panels/Panel4/Droppable Area2".is_right_answer == true:
			if $"Panels/Panel4/Droppable Area3".is_right_answer == true and $"Panels/Panel4/Droppable Area4".is_right_answer == true:
				$Panels/Panel4/Door.close_door()
		else:
			$Panels/Panel4/Door.open_door()
		
		if $"Panels/Panel3/Droppable Area".is_right_answer == true and $"Panels/Panel3/Droppable Area2".is_right_answer == true:
			$Panels/Panel3/Door.close_door()
		else:
			$Panels/Panel3/Door.open_door()
	
	if level_name == "level8":
		if $"Panels/Panel 3/1".is_right_answer == true and $"Panels/Panel 3/2".is_right_answer == true:
			$"Panels/Panel 3/Door".close_door()
		else:
			$"Panels/Panel 3/Door".open_door()
	
	if level_name == "level9":
		if $"Panels/Panel2/Droppable Area".is_right_answer == true and $"Panels/Panel2/Droppable Area2".is_right_answer == true:
			$Panels/Panel2/Door.close_door()
		else:
			$Panels/Panel2/Door.open_door()
		
		if $"Panels/Panel4/Droppable Area".is_right_answer == true and $"Panels/Panel4/Droppable Area2".is_right_answer == true:
			$Panels/Panel4/Door.close_door()
		else:
			$Panels/Panel4/Door.open_door()
			$treasures
	if level_name == "quiz level 2":
		if $"1".is_right_answer and $"2".is_right_answer:
			$Door.close_door()
		else:
			$Door.open_door()
		if $"3".is_right_answer and $"4".is_right_answer:
			$Door2.close_door()
		else:
			$Door2.open_door()


func _on_exit_body_entered(body):
	get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_packed(NextLevel)


func _on_coin_body_entered(body):
	if body is Player:
		collected_coins += 1
		$Coin.queue_free()
		$CanvasLayer/coin_count.text = "Coins: " + str(collected_coins)


func _on_coin_2_body_entered(body):
	if body is Player:
		collected_coins += 1
		$Coin2.queue_free()
		$CanvasLayer/coin_count.text = "Coins: " + str(collected_coins)

func _on_coin_3_body_entered(body):
	if body is Player:
		collected_coins += 1
		$Coin3.queue_free()
		$CanvasLayer/coin_count.text = "Coins: " + str(collected_coins)


func _on_coin_4_body_entered(body):
	if body is Player:
		collected_coins += 1
		$"Panels/Panel 1/Coin 4".queue_free()
		$CanvasLayer/coin_count.text = "Coins: " + str(collected_coins)
