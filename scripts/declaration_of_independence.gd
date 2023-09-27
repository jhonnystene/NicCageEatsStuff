extends Area2D

func _on_timer_timeout():
	print("Declaration of Independence spawning")
	
	if(visible):
		print("edit: nvm already here dawg")
		return
		
	if(randi_range(0, 100) < 33):
		show()
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
	else:
		print("edit: nvm randi_range(0, 100) is greater than or equal to 33")
		
func _on_body_entered(body):
	if("NicCage" in body.name):
		hide()
		body.invulnerable = true
		body.invulnerable_timer = 10
		body.speed += 10
		position.x = 5000
		position.y = 5000
