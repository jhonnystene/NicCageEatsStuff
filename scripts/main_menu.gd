extends Control

func _on_playbutton_pressed():
	get_tree().change_scene_to_file("res://scenes/Game.tscn")


func _on_quitbutton_pressed():
	get_tree().quit()
