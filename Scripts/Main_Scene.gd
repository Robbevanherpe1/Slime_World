extends Node2D

func _ready():
	# At startup set player to start position
	$Player.position = Global.get_player_position()
