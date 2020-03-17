extends Node

var circling = false

func _process(delta):
	var score = get_parent().get_node("NicCage").score
	var maxCeleryCount = 0
	
	maxCeleryCount = floor((score / 4) + 1)
		
	if(get_child_count() < maxCeleryCount):
		var instance = load("res://Celery.tscn").instance()
		instance.position.x = rand_range(0, 1025)
		instance.position.y = rand_range(0, 601)
		add_child(instance)
