extends Node2D

var player_exit = false
var player

func _process(delta):
	if player_exit == true:
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene_to_file("res://Scenes/Main_Scene.tscn")

func _on_exit_body_entered(body):
	if body.is_in_group("Player"):
		player_exit = true

func _on_exit_body_exited(body):
	if body.is_in_group("Player"):
		player_exit = false
