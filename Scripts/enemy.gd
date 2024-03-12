extends CharacterBody2D

var HP = 100
var speed = 150
var player_chase = false
var player_attack = false
var player = null
var Attack_timer = 0

func _ready():
	visible =false

func _process(_delta):
	if player_attack:
		if HP >0:
			attack_player()
			if Input.is_action_just_pressed("fight") and player.player_stamina != 0:
				HP -= 30
				set_health_bar()
				attack_player()
		else:
				$AnimatedSprite2D.play("dead")
				queue_free()
				print("enemy killed")
			
func _physics_process(_delta):
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
	$Healthbar.value = HP
	
func attack_player():
	Attack_timer +=1
	if Attack_timer ==100: #speed of attack
		player.player_health -= 10
		Attack_timer = 0
	else:
		if Attack_timer >100:
			Attack_timer = 0

func _on_detection__area_body_entered(body):
	if body.is_in_group("Player"):
		visible = true
		player = body
		player_chase = true
		print("Found enemy")

func _on_detection__area_body_exited(body):
	if body.is_in_group("Player"):
		player = null
		player_chase =false

func _on_player_azone_body_entered(body):
	if body.is_in_group("Player"):
		player_attack = true

func _on_player_azone_body_exited(body):
	if body.is_in_group("Player"):
		player_attack=false
