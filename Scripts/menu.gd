extends Control

func _ready():
	# At start hide menu
	$MenuScreen.visible = false

func _process(_delta):
	# If menu action pressed show menu
	if Input.is_action_pressed("menu"):
		$MenuScreen.visible = true

func _on_escape_button_pressed():
	# If escape button pressed hide menu
	$MenuScreen.visible = false

func _on_menu_button_pressed():
	# If menu button pressed show menu and reset player position
	Global.set_player_position(Global.player_position_default) 
	get_tree().change_scene_to_file("res://Scenes/Start_Screen.tscn")

func _on_save_button_pressed():
	Global.save_game()

func _on_quit_button_pressed():
	# If quit button pressed quit game
	get_tree().quit()
