extends Node2D

var player_exit = false
var player

func _process(_delta):
		# If player in exit zone and press enter action change sceneto main
	if player_exit == true:
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene_to_file("res://Scenes/Main_Scene.tscn")

func _on_exit_body_entered(body):
	# If player enters exit zone show actionkey and set player_exit mode true
	if body.is_in_group("Player"):
		Global.set_player_actionkey(true)
		player_exit = true

func _on_exit_body_exited(body):
	# If player exits the exit zone hide actionkey and set player_exit mode false
	if body.is_in_group("Player"):
		Global.set_player_actionkey(false)
		player_exit = false


func _on_buy_items_body_entered(_body):
	pass

func _on_buy_items_body_exited(_body):
	pass
