extends Control

func _on_play_game_pressed():
	# If playgame pressed change scene to Main
	get_tree().change_scene_to_file("res://Scenes/Main_Scene.tscn")
