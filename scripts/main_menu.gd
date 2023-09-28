extends Control

func _process(_delta):
	if(WebServicesController.token):
		$SignInButton.hide()

func _on_playbutton_pressed():
	get_tree().change_scene_to_file("res://scenes/Game.tscn")


func _on_quitbutton_pressed():
	get_tree().quit()

func _on_sign_in_button_pressed():
	get_tree().change_scene_to_file("res://scenes/sign_in.tscn")

func _on_leaderboards_button_pressed():
	get_tree().change_scene_to_file("res://scenes/leaderboards.tscn")
