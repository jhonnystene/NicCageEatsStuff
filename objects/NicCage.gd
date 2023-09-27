extends CharacterBody2D

var speed = 400
var score = 0
var lives = 3
var invulnerable = false
var invulnerable_timer = 0
var immovable = false

func hit():
	if not(invulnerable):
		lives -= 1
	invulnerable = true
	invulnerable_timer = 2

func _process(delta):
	invulnerable_timer -= delta
	if(invulnerable_timer < 0):
		invulnerable_timer = 0
	get_parent().get_node("Control/ScoreLabel").text = "Score: " + str(score)
	get_parent().get_node("Control/LivesLabel").text = "Lives: " + str(lives)

func _physics_process(_delta):
	var left = -int(Input.is_action_pressed("moveLeft"))
	var right = int(Input.is_action_pressed("moveRight"))
	var horiz = left + right
	
	var up = -int(Input.is_action_pressed("moveUp"))
	var down = int(Input.is_action_pressed("moveDown"))
	var vert = up + down
	
	if(lives > 0):
		get_parent().get_node("GameOver").hide()
		show()
		if(Input.is_action_pressed("invulerable")):
			invulnerable = true
			immovable = true
		else:
			if(invulnerable_timer == 0):
				invulnerable = false
			
			immovable = false
		
		get_node("Sprite2D").modulate.a = 1
		if(invulnerable):
			if(invulnerable_timer == 0 or (invulnerable_timer - floor(invulnerable_timer) > 0.5)):
				get_node("Sprite2D").modulate.a = 0.5
		
		if not(immovable):
			set_velocity(Vector2(horiz * speed, vert * speed))
			move_and_slide()
	else:
		get_parent().get_node("GameOver").show()
		hide()
		get_tree().paused = true
	
	if(score == 69):
		get_parent().get_node("Win").show()
		hide()
		get_tree().paused = true
	else:
		get_parent().get_node("Win").hide()
		
	if(position.x < 0):
		position.x = 1024
	elif(position.x > 1024):
		position.x = 0
	
	if(position.y < 0):
		position.y = 600
	elif(position.y > 600):
		position.y = 0
