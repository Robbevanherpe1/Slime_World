extends Node

var swords = []
var shields = []
var bows = []
var arrows = []

var item_price
const sword2_price = "100"
const sword3_price = "500"
const sword4_price = "5000"
const sword5_price = "20 000"
const sword6_price = "100 000"

const shield2_price = "2500"

const bow2_price = "1000"
const bow3_price = "10 000"
const bow4_price = "40 000"
const bow5_price = "80 000"
const bow6_price = "150 000"
const bow7_price = "350 000"
const bow8_price = "1 000 000"

const arrow2_price = "5000"

const healthPotion_price = "2000"
const hulkPotion_price = "10 000"
const speedPotion_price = "50 000"
const extra_price = ""

var sword_damage
var schield_health =0
var bow_power
var arrow_damage

var weapon_equiped ="Sword"


func _ready():
	set_items()

func _process(_delta):
	set_weapon_equiped()
	set_sword_damage()
	set_schield_health()
	set_bow_power()
	set_arrow_damage()

func add_useable_item(type):
	match type:
		"ShieldPotion":
			Global.health_potions_amount += 1
			print(Global.health_potions_amount)
		"HulkPotion":
			Global.hulk_potions_amount += 1
		"SpeedPotion":
			Global.speed_potions_amount += 1
		"extra":
			Global.extra += 1



func set_items():
	#at start make lists of all weapons
		for n in range(6):
			swords.append("res://Assets/game/used weapons/sword" + str(n+1) + ".png")
		for n in range(2):
			shields.append("res://Assets/game/used weapons/shield" + str(n+1) + ".png")
		for n in range(8):
			bows.append("res://Assets/game/used weapons/bow" + str(n+1) + ".png")
		for n in range(2):
			arrows.append("res://Assets/game/used weapons/arrow" + str(n+1) + ".png")

func set_item_price1(item):
	#we get the selected index in shop and set price equal to price item
	match item:
		"[0]":
			item_price = int(sword2_price)
		"[1]":
			item_price = int(sword3_price)
		"[2]":
			item_price = int(sword4_price)
		"[3]":
			item_price = int(sword5_price)
		"[4]":
			item_price = int(sword6_price)
		"[5]":
			item_price = int(bow2_price)
		"[6]":
			item_price = int(bow3_price)
		"[7]":
			item_price = int(bow4_price)
		"[8]":
			item_price = int(bow5_price)
		"[9]":
			item_price = int(bow6_price)
		"[10]":
			item_price = int(bow7_price)
		"[11]":
			item_price = int(bow8_price)
		"[12]":
			item_price = int(arrow2_price)
		"[13]":
			item_price = int(shield2_price)
		_:
			item_price = 0
			
func set_item_price2(item):
	#we get the selected index in shop and set price equal to price item
	match item:
		"[0]":
			item_price = int(healthPotion_price)
		"[1]":
			item_price = int(hulkPotion_price)
		"[2]":
			item_price = int(speedPotion_price)
		"[3]":
			item_price = int(extra_price)
		"[4]":
			item_price = int(extra_price)
		"[5]":
			item_price = int(extra_price)
		"[6]":
			item_price = int(extra_price)
		"[7]":
			item_price = int(extra_price)
		"[8]":
			item_price = int(extra_price)
		"[9]":
			item_price = int(extra_price)
		"[10]":
			item_price = int(extra_price)
		"[11]":
			item_price = int(extra_price)
		"[12]":
			item_price = int(extra_price)
		"[13]":
			item_price = int(extra_price)
		_:
			item_price = 0

func set_sword_damage():
	#setting sword_damage according to players sword
	for item in range(swords.size()) :
		if  Global.player_sword == swords[item]:
			sword_damage = item + 1
			break

func set_schield_health():
	#setting schield_health according to players shield
	for item in range(shields.size()) :
		if  Global.player_shield == shields[item]:
			schield_health = item + 1
			break

func set_bow_power():
	#setting bow_power according to players bow
	for item in range(bows.size()) :
		if  Global.player_bow == bows[item]:
			bow_power = item + 1
			break

func set_arrow_damage():
	#setting arrow_damage according to players arrow
	for item in range(arrows.size()) :
		if  Global.player_arrow == arrows[item]:
			arrow_damage = item + 1
			break

func set_weapon_equiped():
	if Input.is_action_just_pressed("useBow"):
		weapon_equiped = "Bow"
	if Input.is_action_just_pressed("useSword"):
		weapon_equiped = "Sword"
		

