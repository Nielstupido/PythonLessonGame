extends Node


var username = ""

var players_dets = {
	"test_username" : "test_password"
}

var player_game_data = {
	"usernamme" : "",
	"current_level" : 1,
	"level_1" : ["COMPLETED", 10, 2], #"level_number" : [level_status, level_points, level_mistakes]
	"level_2" : ["UNCOMPLETE", 0, 0],
	"level_3" : ["LOCKED", 0, 0],
	"level_4" : ["LOCKED", 0, 0],
	"level_5" : ["LOCKED", 0, 0],
	"level_6" : ["LOCKED", 0, 0],
	"level_7" : ["LOCKED", 0, 0],
	"level_8" : ["LOCKED", 0, 0],
	"level_9" : ["LOCKED", 0, 0],
	"level_10" : ["LOCKED", 0, 0],
	"quiz_level_1" : ["LOCKED", 0, 0],
	"quiz_level_2" : ["LOCKED", 0, 0],
}


func get_avg_mistakes():
	var avg = 0
	
	for i in range(1, 10):
		avg += player_game_data["level_" + str(i)][2]
	
	for i in range(1, 2):
		avg += player_game_data["quiz_level_" + str(i)][2]
	
	avg = avg / 12
	
	return avg


func get_total_points():
	var total = 0
	
	for i in range(1, 10):
		total += player_game_data["level_" + str(i)][2]
	
	for i in range(1, 2):
		total += player_game_data["quiz_level_" + str(i)][2]
	
	return total


func clear_current_player_data():
	player_game_data = null
	username = ""


func reset_player_game_data():
	player_game_data["current_level"] = 1
	player_game_data["level_1"] = ["UNCOMPLETE", 0, 0]
	player_game_data["level_2"] = ["LOCKED", 0, 0]
	player_game_data["level_3"] = ["LOCKED", 0, 0]
	player_game_data["level_4"] = ["LOCKED", 0, 0]
	player_game_data["level_5"] = ["LOCKED", 0, 0]
	player_game_data["level_6"] = ["LOCKED", 0, 0]
	player_game_data["level_7"] = ["LOCKED", 0, 0]
	player_game_data["level_8"] = ["LOCKED", 0, 0]
	player_game_data["level_9"] = ["LOCKED", 0, 0]
	player_game_data["level_10"] = ["LOCKED", 0, 0]
	player_game_data["quiz_level_1"] = ["LOCKED", 0, 0]
	player_game_data["quiz_level_2"] = ["LOCKED", 0, 0]


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
