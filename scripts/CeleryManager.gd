extends Node

var circling = false

func _process(delta):
	var score = get_parent().get_node("NicCage").score
	var nic_cage_position = get_parent().get_node("NicCage").position
	var maxCeleryCount = 0
	
	maxCeleryCount = floor((score / 4) + 1)
		
	if(get_child_count() < maxCeleryCount):
		var instance = load("res://objects/Celery.tscn").instantiate()
		instance.position.x = randf_range(0, 1025)
		instance.position.y = randf_range(0, 601)
		
		if(abs(abs(instance.position.x) - abs(nic_cage_position.x)) < 50):
			pass
		elif(abs(abs(instance.position.y) - abs(nic_cage_position.y)) < 50):
			pass
		else:
			add_child(instance)
