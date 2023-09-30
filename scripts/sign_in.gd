extends Control

func _ready():
	WebServicesController.connect("auth_success", auth_success)
	WebServicesController.connect("auth_failure", auth_failure)

func _process(delta):
	if(Input.is_action_just_pressed("enter")):
		_on_sign_in_pressed()

func auth_success():
	Global.signed_in()

func auth_failure(message):
	if(message):
		$SignInControl/ErrorLabel.text = message
	else:
		$SignInControl/ErrorLabel.text = "Couldn't reach stene.xyz"
	$SignInControl.show()

func _on_sign_in_pressed():
	if not($SignInControl/Username.text and $SignInControl/Password.text):
		$SignInControl/ErrorLabel.text = "Username and password required"
		return
	$SignInControl.hide()
	WebServicesController.username = $SignInControl/Username.text
	WebServicesController.password = $SignInControl/Password.text
	WebServicesController.login()

func _on_sign_up_pressed():
	if not($SignInControl/Username.text and $SignInControl/Password.text):
		$SignInControl/ErrorLabel.text = "Username and password required"
		return
	$SignInControl.hide()
	WebServicesController.username = $SignInControl/Username.text
	WebServicesController.password = $SignInControl/Password.text
	WebServicesController.signup()

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
