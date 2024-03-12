extends Node2D

func _ready():
	$Player.position = Global.get_player_position()
