extends Node

func _process(_delta):
	if(Input.is_action_just_pressed("reset")):
		get_tree().paused = false
		get_tree().change_scene_to_file("res://scenes/Game.tscn")
