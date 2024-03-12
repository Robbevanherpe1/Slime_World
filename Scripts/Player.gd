extends CharacterBody2D

var direction:Vector2 = Vector2.ZERO

var speed = 50
var player_health = 100
var player_stamina = 100
var stamina_timer = 0

func _ready():
	# At start add to group Player for checking if player
	self.add_to_group("Player")

func _process(_delta):
	# Set direction to vector 4 of left right up down
	direction =Input.get_vector("P_left","P_right","P_up","P_down")
	
	# Set health and stamina bar value
	$stats/ColorRect/health_bar_player/health_player.text = ("%s / 100") % player_health
	$stats/ColorRect/health_bar_player.value = player_health
	$stats/ColorRect/stamina_bar_player/stamina_player.text = ("%s / 100") % player_stamina
	$stats/ColorRect/stamina_bar_player.value = player_stamina
	
	# Show actionkey when in action zone
	$ActionKey.visible = Global.get_player_actionkey()
	
	# If fight pressed remove stamina else add
	if Input.is_action_just_pressed("fight"):
		remove_stamina()
	else:
		add_stamina()

	# If player_health <=0 vhange sceen to start
	if player_health <=0:
		get_tree().change_scene_to_file("res://Scenes/Start_Screen.tscn")

func _physics_process(_delta):
	# set velocity then move with move_and_slide(velocity)
	velocity = direction * speed
	move_and_slide()
	
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
				$AnimatedSprite2D.play("walk")
			elif direction.y < 0:
				$AnimatedSprite2D.play("up")
			elif direction.y > 0:
				$AnimatedSprite2D.play("down")
				
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
	
