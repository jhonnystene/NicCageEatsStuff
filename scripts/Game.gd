extends Node2D

func _process(_delta):
	if(WebServicesController.token):
		if(Global.highest_score):
			$UI/ScoreLabel.text = "Score: " + str($NicCage.score) + " (high score: " + str(Global.highest_score) + ")"
		else:
			$UI/ScoreLabel.text = "Score: " + str($NicCage.score)
	else:
		$UI/ScoreLabel.text = "Score: " + str($NicCage.score) + " (not signed in - score won't be saved)"
	$UI/LivesLabel.text = "Lives: " + str($NicCage.lives)
	
	if(WebServicesController.token):
		$UI/SignedInLabel.text = "Signed in as " + WebServicesController.username
	else:
		$UI/SignedInLabel.text = "Not signed in - score will not be saved"
