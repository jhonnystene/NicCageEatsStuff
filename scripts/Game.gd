extends Node2D

func _ready():
	WebServicesController.connect("score_submitted", score_submitted)
	WebServicesController.connect("leaderboards_failure", score_submit_fail)

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
		
func score_submitted():
	$GameOver/NewHighScoreLabel/SubmittingLabel.text = "Score submitted!"

func score_submit_fail(message):
	$GameOver/NewHighScoreLabel/SubmittingLabel.text = "Score submit failed: " + message
