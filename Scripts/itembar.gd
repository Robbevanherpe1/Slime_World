extends Control

func _ready():
	# At start show itemmenu
	visible = true

func _process(_delta):
	#set the player items
	if Global.health_potions_amount != 0:
		$Items.set_item_icon( 0, load("res://Assets/game/used_items/healthPotion.png"))
		$Items/item1.text = str(Global.health_potions_amount)
	else:
		Empty_ItemSLot(1)
	
	if Global.hulk_potions_amount != 0:
		$Items.set_item_icon( 1, load("res://Assets/game/used_items/hulkPotion.png"))
		$Items/item2.text = str(Global.hulk_potions_amount)
	else:
		Empty_ItemSLot(2)
	
	if Global.extra != 0:
		$Items.set_item_icon( 2, load("res://Assets/game/used_items/emptyItemSlot.png"))
		$Items/item2.text = str(Global.hulk_potions_amount)
	else:
		Empty_ItemSLot(3)
	
	if Global.extra != 0:
		$Items.set_item_icon( 3, load("res://Assets/game/used_items/emptyItemSlot.png"))
		$Items/item2.text = str(Global.hulk_potions_amount)
	else:
		Empty_ItemSLot(4)
	
	if Global.extra != 0:
		$Items.set_item_icon( 4, load("res://Assets/game/used_items/emptyItemSlot.png"))
		$Items/item2.text = str(Global.hulk_potions_amount)
	else:
		Empty_ItemSLot(5)


func  Empty_ItemSLot(itemslot):
		match itemslot:
			1:
				$Items.set_item_icon( 0, load("res://Assets/game/used_items/emptyItemSlot.png"))
				$Items/Panel1.visible = false
				$Items/item1.text = ""
			2:
				$Items.set_item_icon( 1, load("res://Assets/game/used_items/emptyItemSlot.png"))
				$Items/Panel2.visible = false
				$Items/item2.text = ""
			3:
				$Items.set_item_icon( 2, load("res://Assets/game/used_items/emptyItemSlot.png"))
				$Items/Panel3.visible = false
				$Items/item3.text = ""
			4:
				$Items.set_item_icon( 3, load("res://Assets/game/used_items/emptyItemSlot.png"))
				$Items/Panel4.visible = false
				$Items/item4.text = ""
			5:
				$Items.set_item_icon( 4, load("res://Assets/game/used_items/emptyItemSlot.png"))
				$Items/Panel5.visible = false
				$Items/item5.text = ""
			_:
				print("error Itembar itemslot index")

func _on_items_item_clicked(index, _at_position, _mouse_button_index):
	match index:
		0:
			Global.health_potions_amount -= 1
			if (Global.max_player_health -Global.player_health) > 50:
				Global.player_health += 50
			else: 
				Global.player_health = Global.max_player_health
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
