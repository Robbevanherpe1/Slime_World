extends Node

var player_enter_building = false
var player_enter_tunnel = false
var player_position
var building_type
var tunnel_type
var player_actionkey = false 
var level


func _process(_delta):
	#if player inside enter building zone and pressed enter builing set player position to entrace door and change scene building
	match level:
		1:
			if player_enter_building == true:
				change_Building()
			else:
				if player_enter_tunnel == true:
					if Input.is_action_just_pressed("enter"):
						match tunnel_type:
							"tunnel1":
								Global.set_player_position(Vector2(832,508))
								get_tree().change_scene_to_file("res://Scenes/Main_Scene.tscn")
								print("tunnel1 taken")
							"tunnel2":
								Global.set_player_position(Vector2(1410,162))
								get_tree().change_scene_to_file("res://Scenes/Main_Scene.tscn")
								print("tunnel2 taken")
							"tunnel3":
								Global.set_player_position(Vector2(803,287))
								get_tree().change_scene_to_file("res://Scenes/Main_Scene.tscn")
								print("tunnel3 taken")
		2:
			if player_enter_building == true:
				change_Building()
			else:
				if player_enter_tunnel == true:
					if Input.is_action_just_pressed("enter"):
						match tunnel_type:
							"tunnel1":
								Global.set_player_position(Vector2(-1459,-747))
								get_tree().change_scene_to_file("res://Scenes/lv_2.tscn")
								print("tunnel1 taken")
							"tunnel2":
								Global.set_player_position(Vector2(-1555,1304))
								get_tree().change_scene_to_file("res://Scenes/lv_2.tscn")
								print("tunnel2 taken")
							"tunnel3":
								Global.set_player_position(Vector2(-1395,-40))
								get_tree().change_scene_to_file("res://Scenes/lv_2.tscn")
								print("tunnel3 taken")




func change_Building():
	if Input.is_action_just_pressed("enter"):
		Global.set_player_position(player_position)
		match building_type:
			"Shop":
				get_tree().change_scene_to_file("res://Scenes/Shop.tscn")
			"WeaponShop":
				get_tree().change_scene_to_file("res://Scenes/weapon_shop.tscn")
			"Pub":
				get_tree().change_scene_to_file("res://Scenes/Pub.tscn")
			"House_1":
				get_tree().change_scene_to_file("res://Scenes/House_1.tscn")
			"House_2":
				get_tree().change_scene_to_file("res://Scenes/House_2.tscn")
			_:
				print("error path scene ")
