extends Node2D

func _process(_delta):
	if(WebServicesController.token):
		$UI/SignedInLabel.text = "Signed in as " + WebServicesController.username
		if(Global.highest_score):
			$UI/HighScoreLabel.text = "High score: " + str(Global.highest_score)
		else:
			$UI/HighScoreLabel.text = ""
	else:
		$UI/SignedInLabel.text = "Not signed in - score will not be saved"
	$UI/LivesLabel.text = "Lives: " + str($NicCage.lives)
	$UI/ScoreLabel.text = "Score: " + str($NicCage.score)
		
