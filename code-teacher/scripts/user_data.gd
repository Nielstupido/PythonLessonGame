extends Node


var username = ""

var players_dets = {
	"test_username" : "test_password"
}

var player_game_data = {
	"usernamme" : "",
	"password" : "",
	"current_level" : 0,
	"total_points" : 0,
	"level_1" : ["locked", 0, 0], #"level_number" : [level_status, level_points, level_mistakes]
	"level_2" : ["locked", 0, 0],
	"level_3" : ["locked", 0, 0],
	"level_4" : ["locked", 0, 0],
	"level_5" : ["locked", 0, 0],
	"level_6" : ["locked", 0, 0],
	"level_7" : ["locked", 0, 0],
	"level_8" : ["locked", 0, 0],
	"level_9" : ["locked", 0, 0],
	"level_10" : ["locked", 0, 0],
}


func clear_current_player_data():
	player_game_data = null
	username = ""


func reset_player_game_data():
	player_game_data["current_level"] = 0
	player_game_data["total_points"] = 0


func save_player_data():
	var save_file = FileAccess.open("user://" + username + ".json", FileAccess.WRITE)
	var json_string = JSON.stringify(player_game_data)
	save_file.store_line(json_string)


func load_player_data() -> bool:
	if not FileAccess.file_exists("user://" + username + ".json"):
		return false
	
	var save_file = FileAccess.open("user://" + username + ".json", FileAccess.READ)
	var json = JSON.new()
	var json_string = save_file.get_line()
	var parse_result = json.parse(json_string)
	
	if parse_result != OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return false
	
	player_game_data = json.data
	return true


func save_players_dets():
	var save_file = FileAccess.open("user://players.json", FileAccess.WRITE)
	var json_string = JSON.stringify(players_dets)
	save_file.store_line(json_string)


func load_players_dets() -> bool:
	if not FileAccess.file_exists("user://players.json"):
		return false
	
	var save_file = FileAccess.open("user://players.json", FileAccess.READ)
	var json = JSON.new()
	var json_string = save_file.get_line()
	var parse_result = json.parse(json_string)
	
	if parse_result != OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return false
	
	players_dets = json.data
	return true
