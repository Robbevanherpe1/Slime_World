extends Node

var player_position_default = Vector2(645,160) # Position of player in scene default
var player_position = Vector2(645,160) # Position of player in scene
var player_actionkey = false # Show Action key to player
var player_coins = 0

func set_player_position(value):
	player_position = value

func get_player_position():
	return player_position
	
func set_player_actionkey(value):
	player_actionkey = value

func get_player_actionkey():
	return player_actionkey

func set_player_coins(amount):
	player_coins += amount

func get_player_coins():
	return player_coins
	
