extends Control

func _ready():
	WebServicesController.connect("leaderboards_failure", leaderboards_failure)
	WebServicesController.connect("leaderboards_loaded", leaderboards_loaded)
	WebServicesController.get_leaderboards()

func leaderboards_failure(message):
	$ItemList.clear()
	$ItemList.add_item("Leaderboard failure:")
	$ItemList.add_item(message)

func leaderboards_loaded(data):
	$ItemList.clear()
	var list = []
	for user in data:
		list.append(str(data[user]) + ":" + user)
	list.sort_custom(func(a, b): return a.naturalnocasecmp_to(b) < 0)
	list.reverse()
	for i in range(0, len(list)):
		var entry = list[i].split(":")
		$ItemList.add_item("#" + str(i + 1) + ": " + entry[1] + " (" + str(entry[0]) + " points)")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
