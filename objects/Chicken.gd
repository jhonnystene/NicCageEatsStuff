extends Area2D

func _on_Chicken_body_entered(body):
	if("NicCage" in body.name):
		var nic_cage_position = get_parent().get_node("NicCage").position
		while true:
			position.x = randf_range(100, 925)
			position.y = randf_range(100, 501)
			if(abs(abs(position.x) - abs(nic_cage_position.x)) < 150):
				pass
			elif(abs(abs(position.y) - abs(nic_cage_position.y)) < 150):
				pass
			else:
				break
		body.score += 1
		if(body.score % 3 == 0):
			if(get_parent().get_node("CeleryManager").circling):
				get_parent().get_node("CeleryManager").circling = false
				for child in get_parent().get_node("CeleryManager").get_children():
					child.hv = randf_range(50, 100)
					child.vv = randf_range(50, 100)
			else:
				get_parent().get_node("CeleryManager").circling = true
		if(body.score % 10 == 0):
			body.lives += 1
