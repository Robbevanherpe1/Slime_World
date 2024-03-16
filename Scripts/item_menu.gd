extends Control

func _ready():
	# At start hide menu
	$ItemMenuScreen.visible = false

func _process(_delta):
	# If item_menu action pressed show item menu
	if Input.is_action_just_pressed("item_menu"):
		if $ItemMenuScreen.visible == true:
			$ItemMenuScreen.visible = false
		else:
			$ItemMenuScreen.visible = true
		
	#set the player items
	$ItemMenuScreen/ItemList1.set_item_icon( 0, load(Global.player_sword))
	$ItemMenuScreen/ItemList1.set_item_icon( 1, load(Global.player_bow))
	$ItemMenuScreen/ItemList1.set_item_icon( 2, load(Global.player_shield))
	$ItemMenuScreen/ItemList1.set_item_icon( 3, load(Global.player_arrow))
	
	
