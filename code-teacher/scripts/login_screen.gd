extends Control


@onready var error_msg = $ErrorMessage
@onready var login_panel = $Login
@onready var create_account_panel = $CreateAccount
@onready var login_username_input = $Login/UserInput/Inputs/UsernameInput
@onready var login_password_input = $Login/UserInput/Inputs/PasswordInput
@onready var create_username_input = $CreateAccount/UserInput/Inputs/UsernameInput
@onready var create_password_input = $CreateAccount/UserInput/Inputs/PasswordInput


func _ready():
	_on_go_to_log_in_pressed()
	USERDATA.load_players_dets()


func _on_login_button_pressed():
	if login_username_input.text.is_empty() or login_password_input.text.is_empty():
		return
	
	if USERDATA.players_dets.has(login_username_input.text):
		if USERDATA.players_dets[login_username_input.text] == login_password_input.text:
			self.hide()
		else:
			error_msg.set_error_msg("Incorrect Password!")
	else:
		error_msg.set_error_msg("Username Not Found!")


func _on_create_account_button_pressed():
	if create_username_input.text.is_empty() or create_password_input.text.is_empty():
		return
	
	if USERDATA.players_dets.has(create_username_input.text):
		error_msg.set_error_msg("Username Already Exists!")
	else:
		USERDATA.players_dets[create_username_input.text] = create_password_input.text
		USERDATA.save_players_dets()
		self.hide()


func _on_go_to_create_account_pressed():
	create_account_panel.show()
	login_panel.hide()


func _on_go_to_log_in_pressed():
	login_panel.show()
	create_account_panel.hide()
