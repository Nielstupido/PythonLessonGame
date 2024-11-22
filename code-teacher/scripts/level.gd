extends Node

const HINTS_LIMIT = 2
@export var NextLevel: PackedScene
@export var level_data_copy : Resource
@export var level_name: String
@export var level_num : float
@onready var player = $Player
@onready var pause_menu = $HUD
@onready var end_level_popup = $EndLevelPopup
var level_map = "res://scenes/level_select_screen.tscn"
var current_score = 0
var current_mistakes = 0
var current_used_hints = 0
#var collected_coins := 0


func _ready():
	if level_num > USERDATA.player_game_data["current_level"]:
		USERDATA.player_game_data["current_level"] = level_num
	$LevelPopup.prepare_level_popup()
	
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


func _on_exit_body_entered(body):
	player.controls_paused = true
	player.jump_player = false
	player.move_player = false
	await get_tree().create_timer(0.2).timeout
	end_level_popup.show()
	end_level_popup.prepare_level_popup()


#func _on_coin_body_entered(body):
	#if body is Player:
		#collected_coins += 1
		#$Coin.queue_free()
		#$CanvasLayer/coin_count.text = "Coins: " + str(collected_coins)


#func _on_coin_2_body_entered(body):
	#if body is Player:
		#collected_coins += 1
		#$Coin2.queue_free()
		#$CanvasLayer/coin_count.text = "Coins: " + str(collected_coins)



#func _on_coin_3_body_entered(body):
	#if body is Player:
		#collected_coins += 1
		#$Coin3.queue_free()
		#$CanvasLayer/coin_count.text = "Coins: " + str(collected_coins)


#func _on_coin_4_body_entered(body):
	#if body is Player:
		#collected_coins += 1
		#$"Panels/Panel 1/Coin 4".queue_free()
		#$CanvasLayer/coin_count.text = "Coins: " + str(collected_coins)
