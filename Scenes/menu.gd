extends Control

func _ready():
	$MenuScreen.visible = false

func _process(_delta):
	if Input.is_action_pressed("menu"):
		$MenuScreen.visible = true

func _on_escape_button_pressed():
	$MenuScreen.visible = false

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Start_Screen.tscn") 
