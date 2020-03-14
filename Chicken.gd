extends Area2D

func _on_Chicken_body_entered(body):
	if("NicCage" in body.name):
		position.x = rand_range(0, 1025)
		position.y = rand_range(0, 601)
		body.score += 1
