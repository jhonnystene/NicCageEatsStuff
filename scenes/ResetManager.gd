extends Node

func _process(_delta):
	if(Input.is_action_just_pressed("reset")):
		get_tree().paused = false
		if(get_parent().get_node("NicCage").score == 0):
			get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/Game.tscn")
	
