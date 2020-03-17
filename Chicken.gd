extends Area2D

func _on_Chicken_body_entered(body):
	if("NicCage" in body.name):
		position.x = rand_range(100, 925)
		position.y = rand_range(100, 501)
		body.score += 1
		if(body.score % 3 == 0):
			if(get_parent().get_node("CeleryManager").circling):
				get_parent().get_node("CeleryManager").circling = false
				for child in get_parent().get_node("CeleryManager").get_children():
					child.hv = 100
					child.vv = 100
			else:
				get_parent().get_node("CeleryManager").circling = true
