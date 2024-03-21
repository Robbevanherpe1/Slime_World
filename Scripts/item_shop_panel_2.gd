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
		ItemsGlobal.set_item_price2(selected_item)

func _on_buy_button_pressed():
	match selected_item:
		"[0]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				ItemsGlobal.add_useable_item("ShieldPotion")
		"[1]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				ItemsGlobal.add_useable_item("HulkPotion")
		"[2]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				ItemsGlobal.add_useable_item("extra")
		"[3]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				ItemsGlobal.add_useable_item("extra")
		"[4]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				ItemsGlobal.add_useable_item("extra")
		"[5]":
			if Global.player_coins >= ItemsGlobal.item_price:
				Global.player_coins -= ItemsGlobal.item_price
				ItemsGlobal.add_useable_item("extra")
		_:
			print("error buy item") # Replace with function body.


func set_shop_prices():
	#setting shop labels to item price
	$item1/price.text = ItemsGlobal.healthPotion_price
	$item2/price.text = ItemsGlobal.hulkPotion_price
	$item3/price.text = ItemsGlobal.extra_price
	$item4/price.text = ItemsGlobal.extra_price
	$item5/price.text = ItemsGlobal.extra_price
	$item6/price.text = ItemsGlobal.extra_price
	$item7/price.text = ItemsGlobal.extra_price
	$item8/price.text = ItemsGlobal.extra_price
	$item9/price.text = ItemsGlobal.extra_price
	$item10/price.text = ItemsGlobal.extra_price
	$item11/price.text = ItemsGlobal.extra_price
	$item12/price.text = ItemsGlobal.extra_price
	$item13/price.text = ItemsGlobal.extra_price
	$item14/price.text = ItemsGlobal.extra_price
	$item15/price.text = ItemsGlobal.extra_price
	$item16/price.text = ItemsGlobal.extra_price
	

