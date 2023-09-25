extends Area2D

var hv = randf_range(25, 100)
var vv = randf_range(25, 100)

func _physics_process(delta):
	if(get_parent().circling):
		if(position.distance_to(get_parent().get_parent().get_node("Chicken").position) < 201):
			circleAround(get_parent().get_parent().get_node("Chicken"), 200)
		else:
			var chickenPos = get_parent().get_parent().get_node("Chicken").position
			var goalPos = Vector2()
			var angle = Vector2(hv, vv).angle()
			goalPos.x = (chickenPos.x + cos(angle) * 200) 
			goalPos.y = (chickenPos.y + sin(angle) * 200) 
			
			if(position.x < goalPos.x):
				position.x += 100 * delta
			else:
				position.x -= 100 * delta
			
			if(position.y < goalPos.y):
				position.y += 100 * delta
			else:
				position.y -= 100 * delta
	else:
		if(position.x < 0 or position.x > 1024):
			hv = -hv
		if(position.y < 0 or position.y > 600):
			vv = -vv
		
		position.x += hv * delta
		position.y += vv * delta

func findAngle(object1, object2): # Ported from the original JS
	var x_len = object2.position.x - object1.position.x
	var y_len = object2.position.y - object1.position.y
	var angle = atan(y_len / x_len)
	
	if(object1.position.x > object2.position.x):
		angle += PI
	return angle
	
func circleAround(object, radius): # Also ported from the original JS
	# Get angle
	var angle = Vector2(hv, vv).angle()
	position.x = (object.position.x + cos(angle) * radius) 
	position.y = (object.position.y + sin(angle) * radius) 
	angle = fmod((angle + 0.04), (2 * PI))
	hv = cos(angle)
	vv = sin(angle) 
	
func _on_Celery_body_entered(body):
	if("NicCage" in body.name):
		if not(body.invulnerable):
			position.x = randf_range(0, 1025)
			position.y = randf_range(0, 601)
			body.hit()
