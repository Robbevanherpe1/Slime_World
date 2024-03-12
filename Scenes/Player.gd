extends CharacterBody2D

var direction:Vector2 = Vector2.ZERO

@export var speed :int =50
var player_health = 100
var player_stamina = 100
var stamina_timer = 0

func _ready():
	self.add_to_group("Player")

func _process(_delta):
	direction =Input.get_vector("P_left","P_right","P_up","P_down")
	$stats/ColorRect/health_bar_player/health_player.text = ("%s / 100") % player_health
	$stats/ColorRect/health_bar_player.value = player_health
	$stats/ColorRect/stamina_bar_player/stamina_player.text = ("%s / 100") % player_stamina
	$stats/ColorRect/stamina_bar_player.value = player_stamina
	
	if Input.is_action_just_pressed("fight"):
		remove_stamina()
	else:
		add_stamina()
	
	if player_health <=0:
		get_tree().change_scene_to_file("res://Scenes/Start_Screen.tscn")

func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()
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
	stamina_timer +=1
	if stamina_timer == 100 and player_stamina < 100:
		player_stamina += 10
		stamina_timer = 0
		print("add stamina +10")
	else:
		if stamina_timer > 100:
			stamina_timer = 0

func remove_stamina():
	if player_stamina > 0:
			player_stamina += -10
			print("remove stamina -10")
	
