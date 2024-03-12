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
	# If menu button pressed show menu
	get_tree().change_scene_to_file("res://Scenes/Start_Screen.tscn") 

func _on_test_button_pressed():
	# If test button pressed show shop
	get_tree().change_scene_to_file("res://Scenes/Shop.tscn")
