extends Node2D

var player_enter = false
var player
var player_position

func _process(_delta):
	# If player inside enter building zone and pressed enter builing set player position to entrace door and change scene building
	if player_enter == true:
		if Input.is_action_just_pressed("enter"):
			Global.set_player_position(player_position)
			#Global.set_player_position(Vector2(592,538))
			get_tree().change_scene_to_file("res://Scenes/Shop.tscn")

func _on_area_2d_body_entered(body):
	# If player enters building entrace zone safe set player position and show action key, set player_enter mode true
	if body.is_in_group("Player"):
		player = body
		player_position = player.position
		Global.set_player_actionkey(true)
		player_enter = true

func _on_area_2d_body_exited(body):
	# If player exited entrance zone hide player action set player_enter false
	if body.is_in_group("Player"):
		Global.set_player_actionkey(false)
		player_enter = false
