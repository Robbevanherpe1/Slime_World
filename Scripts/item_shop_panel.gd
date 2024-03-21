extends Control

var selected_item

func _ready():
	# At start hide menu and set prices
	visible = false
	set_shop_prices()

func _process(_delta):
	#set shown coins equal to player coins
	$Coins/coins_amount.text =str(Global.player_coins)
	set_global_price()


func set_global_price():
	#if anything selected set global itemprice to item's price
	if $ItemList.is_anything_selected():
		selected_item = str($ItemList.get_selected_items())
		ItemsGlobal.set_item_price1(selected_item)

func _on_buy_button_pressed():
	
	match selected_item:
		"[0]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_sword("res://Assets/game/used weapons/sword2.png")
		"[1]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_sword("res://Assets/game/used weapons/sword3.png")
		"[2]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_sword("res://Assets/game/used weapons/sword4.png")
		"[3]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_sword("res://Assets/game/used weapons/sword5.png")
		"[4]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_sword("res://Assets/game/used weapons/sword6.png")
		"[5]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_bow("res://Assets/game/used weapons/bow2.png")
		"[6]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_bow("res://Assets/game/used weapons/bow3.png")
		"[7]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_bow("res://Assets/game/used weapons/bow4.png")
		"[8]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_bow("res://Assets/game/used weapons/bow5.png")
		"[9]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_bow("res://Assets/game/used weapons/bow6.png")
		"[10]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_bow("res://Assets/game/used weapons/bow7.png")
		"[11]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_bow("res://Assets/game/used weapons/bow8.png")
		"[12]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_arrow("res://Assets/game/used weapons/arrow2.png")
		"[13]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				Global.set_player_shield("res://Assets/game/used weapons/shield2.png")
		_:
			print("error buy item") # Replace with function body.


func set_shop_prices():
	#setting shop labels to item price
	$sword2/price.text = ItemsGlobal.sword2_price
	$sword3/price.text = ItemsGlobal.sword3_price
	$sword4/price.text = ItemsGlobal.sword4_price
	$sword5/price.text = ItemsGlobal.sword5_price
	$sword6/price.text = ItemsGlobal.sword6_price
	$bow2/price.text = ItemsGlobal.bow2_price
	$bow3/price.text = ItemsGlobal.bow3_price
	$bow4/price.text = ItemsGlobal.bow4_price
	$bow5/price.text = ItemsGlobal.bow5_price
	$bow6/price.text = ItemsGlobal.bow6_price
	$bow7/price.text = ItemsGlobal.bow7_price
	$bow8/price.text = ItemsGlobal.bow8_price
	$arrow2/price.text = ItemsGlobal.arrow2_price
	$shield2/price.text = ItemsGlobal.shield2_price
	

