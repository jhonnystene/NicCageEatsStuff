extends KinematicBody2D

var speed = 400
var translucentImg = load("res://invulnerable.png")
var regularImg = load("res://cage.png")
var score = 0
var lives = 3
var invulnerable = false

func _process(delta):
	get_parent().get_node("Control/ScoreLabel").text = "Score: " + str(score)
	get_parent().get_node("Control/LivesLabel").text = "Lives: " + str(lives)

func _physics_process(delta):
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
			get_node("Sprite").texture = translucentImg
			invulnerable = true
		else:
			get_node("Sprite").texture = regularImg
			move_and_slide(Vector2(horiz * speed, vert * speed))
			invulnerable = false
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
