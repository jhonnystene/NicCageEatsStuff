extends Area2D

var hv = 100
var vv = 100

func _physics_process(delta):
	if(get_parent().circling):
		var object
		for child in get_parent().get_parent().get_children():
			if("Chicken" in child.name):
				object = child
		circleAround(object, 200)
		
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
	
func circleAround(object, radius):
	# Get angle
	var angle = Vector2(hv, vv).angle()
	var movement = Vector2()
	position.x = (object.position.x + cos(angle) * radius) 
	position.y = (object.position.y + sin(angle) * radius) 
	angle = fmod((angle + 0.04), (2 * PI))
	hv = cos(angle)
	vv = sin(angle) 
	
func _on_Celery_body_entered(body):
	if("NicCage" in body.name):
		if not(body.invulnerable):
			position.x = rand_range(0, 1025)
			position.y = rand_range(0, 601)
			body.lives -= 1
