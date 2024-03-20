extends Node

var player_position_default = Vector2(645,160) # Position of player in scene default
var player_position = Vector2(645,160) # Position of player in scene
var player_actionkey = false # Show Action key to player
var player_shoot_position = Vector2.ZERO
var enemy_position  =Vector2.ZERO


#player items
var player_coins = 0
var player_sword = "res://Assets/game/used weapons/sword1.png"
var player_shield = "res://Assets/game/used weapons/shield1.png"
var player_bow = "res://Assets/game/used weapons/bow1.png"
var player_arrow = "res://Assets/game/used weapons/arrow1.png"

func set_progress_player():
	#set player progess for development tests
	set_player_coins(0)
	set_player_sword("res://Assets/game/used weapons/sword1.png")
	set_player_shield("res://Assets/game/used weapons/shield1.png")
	set_player_bow("res://Assets/game/used weapons/bow1.png")
	set_player_arrow("res://Assets/game/used weapons/arrow1.png")

#Save Game

var save_path = "user://save_game.save"

func _ready():
	load_data()
	#set_progress_player()
	
func _exit_tree():
	save_game()

func save_game():
	var save_file = FileAccess.open(save_path, FileAccess.WRITE)
	save_file.store_var(player_coins)
	save_file.store_string(player_sword + "\n")
	save_file.store_string(player_shield + "\n")
	save_file.store_string(player_bow + "\n")
	save_file.store_string(player_arrow)
	save_file.close()

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		player_coins = file.get_var()
		player_sword = file.get_line()
		player_shield = file.get_line()
		player_bow = file.get_line()
		player_arrow = file.get_line()
		file.close()
	else:
		print("No data found.")
		player_coins = 0
		player_sword = "res://Assets/game/used weapons/sword1.png"
		player_shield = "res://Assets/game/used weapons/shield1.png"
		player_bow = "res://Assets/game/used weapons/bow1.png"
		player_arrow ="res://Assets/game/used weapons/arrow1.png"
	

#set variables

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

func set_player_sword(type):
	player_sword = type
	
func set_player_shield(type):
	player_shield = type
	
func set_player_bow(type):
	player_bow = type
	
func set_player_arrow(type):
	player_arrow = type
