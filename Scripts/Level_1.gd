extends Node2D

var player_enter = false
var player
var player_position
var building_type

func _process(_delta):
	# If player inside enter building zone and pressed enter builing set player position to entrace door and change scene building
	if player_enter == true:
		if Input.is_action_just_pressed("enter"):
			Global.set_player_position(player_position)
			
			match building_type:
				"Shop":
					get_tree().change_scene_to_file("res://Scenes/Shop.tscn")
				"House_1":
					get_tree().change_scene_to_file("res://Scenes/House_1.tscn")
				_:
					get_tree().change_scene_to_file("res://Scenes/Main_Scene.tscn")
				
func enter_building(body):
	# If player enters building entrace zone safe set player position and show action key, set player_enter mode true
	if body.is_in_group("Player"):
		player = body
		player_position = player.position
		Global.set_player_actionkey(true)
		player_enter = true

func leave_building(body):
	# If player exited entrance zone hide player action set player_enter false
	if body.is_in_group("Player"):
		Global.set_player_actionkey(false)
		player_enter = false

func _on_house_1_body_entered(body):
	enter_building(body)
	building_type = "House_1"

func _on_house_1_body_exited(body):
	leave_building(body)

func _on_shop_body_entered(body):
	enter_building(body)
	building_type = "Shop"

func _on_shop_body_exited(body):
	leave_building(body)
