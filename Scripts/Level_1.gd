extends Node2D

var player
var enter

func _process(_delta):
	if enter == true:
		if Input.is_action_just_pressed("enter"):
			Global.set_player_position(Vector2(-1556,-455))
			get_tree().change_scene_to_file("res://Scenes/lv_2.tscn")

func enter_building(body,type):
	# If player enters building entrace zone safe set player position and show action key, set player_enter_building mode true
	if body.is_in_group("Player"):
		player = body
		GlobalBuildings.player_position = player.position
		GlobalBuildings.player_actionkey = true
		GlobalBuildings.player_enter_building = true
		GlobalBuildings.building_type = type
		GlobalBuildings.level = 1

func leave_building(body):
	# If player exited entrance zone hide player action set player_enter_building false
	if body.is_in_group("Player"):
		GlobalBuildings.player_actionkey = false
		GlobalBuildings.player_enter_building = false
		
func enter_tunnel(body,type):
	if body.is_in_group("Player"):
		GlobalBuildings.player_actionkey = true
		GlobalBuildings.player_enter_tunnel = true
		GlobalBuildings.tunnel_type = type
		GlobalBuildings.level = 1
		
func leave_tunnel(body):
	if body.is_in_group("Player"):
		GlobalBuildings.player_actionkey = false
		GlobalBuildings.player_enter_tunnel = false
		

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

#Next level

func _on_lv_2_body_entered(body):
	if body.is_in_group("Player"):
		GlobalBuildings.player_actionkey = true
		enter = true

func _on_lv_2_body_exited(body):
	if body.is_in_group("Player"):
		enter = false
		GlobalBuildings.player_actionkey = false
