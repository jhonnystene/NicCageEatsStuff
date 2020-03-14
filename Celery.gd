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

func _on_Celery_body_entered(body):
	if("NicCage" in body.name):
		position.x = rand_range(0, 1025)
		position.y = rand_range(0, 601)
		body.lives -= 1
