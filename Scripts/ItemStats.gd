extends Node

var sword_damage
var schield_health
var bow_power
var arrow_damage


func _process(_delta):
	set_sword_damage()
	set_schield_health()
	set_bow_power()
	set_arrow_damage()

func set_sword_damage():
	#setting sword_damage according to players sword
	var index = 1
	for swords in Global.player_sword :
		if  Global.player_sword == "res://Assets/game/used weapons/sword" + str(index) + ".png":
			sword_damage = index
		else:
			index += 1

func set_schield_health():
	#setting schield_health according to players shield
	var index = 1
	for shields in Global.player_shield :
		if  Global.player_shield == "res://Assets/game/used weapons/shield" + str(index) + ".png":
			schield_health = index
		else:
			index += 1

func set_bow_power():
	#setting bow_power according to players bow
	var index = 1
	for bows in Global.player_bow :
		if  Global.player_sword == "res://Assets/game/used weapons/bow" + str(index) + ".png":
			bow_power = index
		else:
			index += 1

func set_arrow_damage():
	#setting arrow_damage according to players arrow
	var index = 1
	for arrows in Global.player_arrow :
		if  Global.player_sword == "res://Assets/game/used weapons/arrow" + str(index) + ".png":
			arrow_damage = index
		else:
			index += 1
