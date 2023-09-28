extends Node

var gameId = "nic-cage-eats-stuff"

signal auth_success
signal game_saved
signal game_loaded(data)
signal leaderboards_loaded(data)
signal score_submitted
signal auth_failure(message)
signal storage_failure(message)
signal leaderboards_failure(message)

var headers = ["Content-Type: application/json"]
var endpoint = "https://gameserver.stene.xyz"

# Auth data
var username = ""
var password = ""
var token = ""

func login():
	if(username == ""):
		print("Can't login, username not set")
		return false
	if(password == ""):
		print("Can't login, password not set")
		return false
	
	$HTTPAuth.request(endpoint + "/login", headers, HTTPClient.METHOD_POST, JSON.stringify({"username": username, "password": password}))
	print("Set log in request")
	return true

func signup():
	if(username == ""):
		print("Can't sign up, username not set")
		return false
	if(password == ""):
		print("Can't sign up, password not set")
		return false
		
	$HTTPAuth.request(endpoint + "/signup", headers, HTTPClient.METHOD_POST, JSON.stringify({"username": username, "password": password}))
	print("Sent sign up request")
	return true

func save_game(game_data):
	if(token == ""):
		print("Can't save, not logged in")
		return false
		
	$HTTPStorage.request(endpoint + "/save", headers, HTTPClient.METHOD_POST, JSON.stringify({"username": username, "token": token, "game": gameId, "data": game_data}))
	print("Sent game save request")
	return true

func load_game():
	if(token == ""):
		print("Can't load, not logged in")
		return false
		
	$HTTPStorage.request(endpoint + "/load", headers, HTTPClient.METHOD_POST, JSON.stringify({"username": username, "token": token, "game": gameId}))
	print("Sent game load request")
	return true
	
func submit_score(score_data):
	if(token == ""):
		print("Can't submit, not logged in")
		return false
	
	$HTTPLeaderboard.request(endpoint + "/submitscore", headers, HTTPClient.METHOD_POST, JSON.stringify({"username": username, "token": token, "game": gameId, "data": score_data}))
	print("Sent score submit request")
	return true

func get_leaderboards():
	$HTTPLeaderboard.request(endpoint + "/viewleaderboards", headers, HTTPClient.METHOD_POST, JSON.stringify({"game": gameId}))
	print("Sent leaderboard get request")
	return true

func _on_http_auth_request_completed(result, response_code, headers, body):
	var recdata = JSON.parse_string(body.get_string_from_utf8())
	
	var status = recdata["status"]
	if(status):
		token = recdata["token"]
		auth_success.emit()
		print("Auth success!")
	else:
		auth_failure.emit(recdata["message"])
		print("Auth failure: " + recdata["message"])

func _on_http_storage_request_completed(result, response_code, headers, body):
	var recdata = JSON.parse_string(body.get_string_from_utf8())
	
	var status = recdata["status"]
	if(status):
		if("save" in recdata):
			game_loaded.emit(recdata["save"])
			print("Load success!")
		else:
			game_saved.emit()
			print("Save success!")
	else:
		storage_failure.emit(recdata["message"])
		print("Storage request failure: " + recdata["message"])

func _on_http_leaderboard_request_completed(result, response_code, headers, body):
	var recdata = JSON.parse_string(body.get_string_from_utf8())
	print(recdata)
	var status = recdata["status"]
	if(status):
		if("data" in recdata):
			leaderboards_loaded.emit(recdata["data"])
			print("Leaderboards get success!")
		else:
			score_submitted.emit()
			print("Leaderboards submit success!")
	else:
		leaderboards_failure.emit(recdata["message"])
		print("Leaderboards request failure: " + recdata["message"])
