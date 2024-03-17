extends Control

var selected_item
var price_item

func _ready():
	# At start hide menu
	visible = false

func _process(_delta):
	#set shown coins equal to player coins
	$Coins/coins_amount.text =str(Global.player_coins)
	buy_item()
	get_price_item(selected_item)
	# If menu action pressed show menu
	if Input.is_action_just_pressed("enter"):
		if visible == false:
			visible = true
		else: 
			visible = false


func buy_item():
	if $ItemList.is_anything_selected():
		selected_item = str($ItemList.get_selected_items())

func get_price_item(item):
	match item:
		"[0]":
			price_item = 100
		"[1]":
			price_item = 500
		"[2]":
			price_item = 5000
		"[3]":
			price_item = 20000
		_:
			price_item = 0
			
	
