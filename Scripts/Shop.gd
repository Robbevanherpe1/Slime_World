extends Node2D

var player_exit = false
var player
var player_buy = false

func _process(_delta):
	# If player in exit zone and press enter action change sceneto main
	if player_exit == true:
		if Input.is_action_just_pressed("enter"):
			match GlobalBuildings.level:
				1:
					get_tree().change_scene_to_file("res://Scenes/Main_Scene.tscn")
				2:
					get_tree().change_scene_to_file("res://Scenes/lv_2.tscn")
	# If player in buy zone and menu action pressed show menu
	if player_buy == true:
		# If menu action pressed show menu
		if Input.is_action_just_pressed("enter"):
			if $item_shop_panel2.visible == false:
				$item_shop_panel2.visible = true
			else: 
				$item_shop_panel2.visible = false

func _on_exit_body_entered(body):
	# If player enters exit zone show actionkey and set player_exit mode true
	if body.is_in_group("Player"):
		GlobalBuildings.player_actionkey = true
		player_exit = true

func _on_exit_body_exited(body):
	# If player exits the exit zone hide actionkey and set player_exit mode false
	if body.is_in_group("Player"):
		GlobalBuildings.player_actionkey = false
		player_exit = false


func _on_buy_items_body_entered(body):
	# If player enters the buy zone show actionkey and set player_buy mode true
	if body.is_in_group("Player"):
		GlobalBuildings.player_actionkey = true
		player_buy = true

func _on_buy_items_body_exited(body):
	# If player exits the buy zone hide actionkey and set player_buy mode false
	if body.is_in_group("Player"):
		GlobalBuildings.player_actionkey = false
		player_buy = false
