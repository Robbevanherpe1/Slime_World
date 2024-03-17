extends CharacterBody2D

var HP = 100
var speed = 150
var player_chase = false
var player_attack = false
var player_attack_bow = false
var player = null
var Attack_timer = 0

func _ready():
	# At start hide enemies
	visible =false

func _process(_delta):
	# If player in attack range and player pressed fight than attack
	if player_attack and ItemsGlobal.weapon_equiped == "Sword":
		if HP >0:
			attack_player()
			if Input.is_action_just_pressed("fight") and player.player_stamina != 0:
				HP -= 30 * ItemsGlobal.sword_damage
				set_health_bar()
				attack_player()
		else:
				$AnimatedSprite2D.play("dead")
				Global.set_player_coins(1)
				queue_free()
				print("enemy killed")
				print("1 coin added")
	if player_attack_bow  and ItemsGlobal.weapon_equiped == "Bow":
		if HP >0:
			if Input.is_action_just_pressed("fight") and player.player_stamina != 0:
				HP -= 25 * ItemsGlobal.bow_power
				set_health_bar()
		else:
				$AnimatedSprite2D.play("dead")
				Global.set_player_coins(1)
				queue_free()
				print("enemy killed")
				print("1 coin added")
		

func _physics_process(_delta):
	# If player not in attack range play walking animations else attack animantions
	if player_attack == false:
		if player_chase:
			position += (player.position - position)/speed
			
			$AnimatedSprite2D.play("walk")
			if(player.position.x - position.x) < 0:
				$AnimatedSprite2D.flip_h = true
			else:
				$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.play("idle")
	else: 
		$AnimatedSprite2D.play("attack")

func set_health_bar():
	#Set healthbar enemies equal to HP
	$Healthbar.value = HP
	
func attack_player():
	# Set a timer and when it hits 100 attack player
	Attack_timer +=1
	if Attack_timer ==100: #speed of attack
		player.player_health -= 10
		print("removed health -10")
		Attack_timer = 0
	else:
		if Attack_timer >100:
			Attack_timer = 0

func _on_detection__area_body_entered(body):
	# If player enters enemy detection area become visible and follow player
	if body.is_in_group("Player"):
		visible = true
		player = body
		player_chase = true
		print("Found enemy")

func _on_detection__area_body_exited(body):
	# If player leaves enemy detection area become visible and stop following player
	if body.is_in_group("Player"):
		player = null
		player_chase =false

func _on_player_azone_body_entered(body):
	# If player gets in attack radius set mode player_attack
	if body.is_in_group("Player"):
		player_attack = true

func _on_player_azone_body_exited(body):
	# If player leaves the attack radius set mode player_attack to false
	if body.is_in_group("Player"):
		player_attack=false


func _on_player_bzone_body_entered(body):
	# If player gets in attack radius set mode player_attack
	if body.is_in_group("Player"):
		player_attack_bow = true


func _on_player_bzone_body_exited(body):
	# If player leaves the attack radius set mode player_attack to false
	if body.is_in_group("Player"):
		player_attack_bow = false
