extends Area2D

var hv = 100
var vv = 100

func _physics_process(delta):
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
	

func _on_Celery_body_entered(body):
	if("NicCage" in body.name):
		if not(body.invulnerable):
			position.x = rand_range(0, 1025)
			position.y = rand_range(0, 601)
			body.lives -= 1
