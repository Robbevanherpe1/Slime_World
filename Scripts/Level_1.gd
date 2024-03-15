extends Node2D

var player_enter_building = false
var player_enter_tunnel = false
var player
var player_position
var building_type
var tunnel_type

func _process(_delta):
	# If player inside enter building zone and pressed enter builing set player position to entrace door and change scene building
	if player_enter_building == true:
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
					get_tree().change_scene_to_file("res://Scenes/House_2.tscn")
				"House_2":
					get_tree().change_scene_to_file("res://Scenes/House_2.tscn")
				_:
					get_tree().change_scene_to_file("res://Scenes/Main_Scene.tscn")
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


func enter_building(body,type):
	# If player enters building entrace zone safe set player position and show action key, set player_enter_building mode true
	if body.is_in_group("Player"):
		player = body
		player_position = player.position
		Global.set_player_actionkey(true)
		player_enter_building = true
		building_type = type

func leave_building(body):
	# If player exited entrance zone hide player action set player_enter_building false
	if body.is_in_group("Player"):
		Global.set_player_actionkey(false)
		player_enter_building = false
		
func enter_tunnel(body,type):
	if body.is_in_group("Player"):
		Global.set_player_actionkey(true)
		player_enter_tunnel = true
		tunnel_type = type
		
func leave_tunnel(body):
	if body.is_in_group("Player"):
		Global.set_player_actionkey(false)
		player_enter_tunnel = false
		

#Buildings

func _on_shop_body_entered(body):
	enter_building(body,"Shop")

func _on_shop_body_exited(body):
	leave_building(body)
	
func _on_weapon_shop_body_entered(body):
	enter_building(body,"WeaponShop")

func _on_weapon_shop_body_exited(body):
	leave_building(body)
	
func _on_pub_body_entered(body):
	enter_building(body,"Pub")

func _on_pub_body_exited(body):
	leave_building(body)

func _on_house_1_body_entered(body):
	enter_building(body,"House_1")

func _on_house_1_body_exited(body):
	leave_building(body)

func _on_house_2_body_entered(body):
	enter_building(body,"House_2")

func _on_house_2_body_exited(body):
	leave_building(body)

#Tunnels

func _on_tunnel_1_body_entered(body):
	enter_tunnel(body,"tunnel1")

func _on_tunnel_1_body_exited(body):
	leave_tunnel(body)

func _on_tunnel_2_body_entered(body):
	enter_tunnel(body,"tunnel2")

func _on_tunnel_2_body_exited(body):
	leave_tunnel(body)

func _on_tunnel_3_body_entered(body):
	enter_tunnel(body,"tunnel3")

func _on_tunnel_3_body_exited(body):
	leave_tunnel(body)

