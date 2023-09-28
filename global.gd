extends Node

var enable_leaderboards_submit = false
var highest_score = 0

func _ready():
	WebServicesController.connect("leaderboards_loaded", leaderboards_loaded)
	WebServicesController.connect("leaderboards_failure", leaderboards_failure)

func signed_in():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	WebServicesController.get_leaderboards()

func leaderboards_loaded(data):
	if(WebServicesController.username in data):
		print("Found previous score: " + str(data[WebServicesController.username]))
		highest_score = int(data[WebServicesController.username])
	enable_leaderboards_submit = true

func leaderboards_failure(message):
	enable_leaderboards_submit = false
	print("Leaderboards submission disabled - get previous score failed")
