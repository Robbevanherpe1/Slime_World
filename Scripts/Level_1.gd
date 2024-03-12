extends Node2D

var player_enter = false
var player

func _process(_delta):
	if player_enter == true:
		if Input.is_action_just_pressed("enter"):
			Global.set_player_position(Vector2(592,538))
			get_tree().change_scene_to_file("res://Scenes/Shop.tscn")

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		Global.set_player_actionkey(true)
		player_enter = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("Player"):
		Global.set_player_actionkey(false)
		player_enter = false
