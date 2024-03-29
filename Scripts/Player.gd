extends CharacterBody2D

var direction:Vector2 = Vector2.ZERO

var speed = 50
var speed_animation = 1
var sprint = false
var player_stamina = 100
var stamina_timer = 0

func _ready():
	# At start add to group Player for checking if player
	self.add_to_group("Player")
	Global.set_player_health(100 + (20 * ItemsGlobal.schield_health))

func _process(_delta):
	movement()
	actionkey()
	set_player_bars()
	Global.set_max_player_health(100 + (20 * ItemsGlobal.schield_health))
	change_stamina()
	player_dead()

func _physics_process(_delta):
	# set velocity then move with move_and_slide(velocity)
	velocity = (direction * speed) * Global.speed_multiplier
	move_and_slide()
	show_animation()

#player movement

func movement():
	# Set direction to vector 4 of left right up down
	direction =Input.get_vector("P_left","P_right","P_up","P_down")
	
	#set sprint speed and normal speed
	if Input.is_action_pressed("sprint"): 
		speed = 100
		speed_animation = 2
	else :
		speed = 50
		speed_animation = 1

#actionkeys

func actionkey():
	# Show actionkey when in action zone
	$ActionKey.visible = GlobalBuildings.player_actionkey

#player state

func player_dead():
	# If player_health <=0 change sceen to start and reset player position
	if Global.player_health <=0:
		$AnimatedSprite2D.play("dead")
		await get_tree().create_timer(2.0).timeout
		Global.set_player_position(Global.player_position_default)
		get_tree().change_scene_to_file("res://Scenes/Start_Screen.tscn")

#animations

func show_animation():
	if ItemsGlobal.weapon_equiped == "Sword":
		# If fight pressed show fight animation else show normal animations
		if Input.is_action_pressed("fight"):
			if direction == Vector2.ZERO:
				$AnimatedSprite2D.play("fight")
			else:
				if direction.x != 0:
					$AnimatedSprite2D.flip_h = direction.x < 0
					$AnimatedSprite2D.play("fight")
				elif direction.y < 0:
					$AnimatedSprite2D.play("fight_up")
				elif direction.y > 0:
					$AnimatedSprite2D.play("fight_down")
		else:
				if direction == Vector2.ZERO:
					$AnimatedSprite2D.play("idle")
				else:
					if direction.x != 0:
						$AnimatedSprite2D.flip_h = direction.x < 0
						$AnimatedSprite2D.play("walk",speed_animation)
					elif direction.y < 0:
						$AnimatedSprite2D.play("up",speed_animation)
					elif direction.y > 0:
						$AnimatedSprite2D.play("down",speed_animation)
	if ItemsGlobal.weapon_equiped == "Bow" :
		if Input.is_action_pressed("fight"):
			if direction == Vector2.ZERO:
				$AnimatedSprite2D.play("shoot")
			else:
				if direction.x != 0:
					$AnimatedSprite2D.flip_h = direction.x < 0
					$AnimatedSprite2D.play("shoot")
				elif direction.y < 0:
					$AnimatedSprite2D.play("bow_up")
				elif direction.y > 0:
					$AnimatedSprite2D.play("bow_down")
		else:
				if direction == Vector2.ZERO:
					$AnimatedSprite2D.play("idle")
				else:
					if direction.x != 0:
						$AnimatedSprite2D.flip_h = direction.x < 0
						$AnimatedSprite2D.play("walk",speed_animation)
					elif direction.y < 0:
						$AnimatedSprite2D.play("up",speed_animation)
					elif direction.y > 0:
						$AnimatedSprite2D.play("down",speed_animation)
		
#stamina and health

func set_player_bars():
	# Set health and stamina bar value
	$stats/ColorRect/health_bar_player/health_player.text = "%s / %s" % [Global.player_health, Global.max_player_health]
	$stats/ColorRect/health_bar_player.value = Global.player_health
	$stats/ColorRect/stamina_bar_player/stamina_player.text = ("%s / 100") % player_stamina
	$stats/ColorRect/stamina_bar_player.value = player_stamina
	$stats/ColorRect/Coins/coins_amount.text = ("%s") % Global.player_coins

func change_stamina():
	# If fight pressed remove stamina else add
	if Input.is_action_just_pressed("fight"):
		remove_stamina()
	else:
		add_stamina()

func add_stamina():
	# Set stamina timer if 100 add +10 stamina
	stamina_timer +=1
	if stamina_timer == 100 and player_stamina < 100:
		player_stamina += 10
		stamina_timer = 0
		print("add stamina +10")
	else:
		if stamina_timer > 100:
			stamina_timer = 0

func remove_stamina():
	# If player_stamina >0 remove -10 stamina
	if player_stamina > 0:
			player_stamina += -10
			print("remove stamina -10")

