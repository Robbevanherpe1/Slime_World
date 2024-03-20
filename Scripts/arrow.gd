extends Sprite2D

var track_enemy = false
var enemy
var rotation_arrow
var speed = 200  # Adjust this value for arrow speed
var deletion_distance = 1

func _physics_process(_delta):
	
	if track_enemy:
		var direction = (Global.enemy_position - position).normalized()
		rotation = direction.angle()
		position += direction * speed * _delta
		
		

func _on_arrow_path_body_entered(body):
	if body.is_in_group("Enemies"):
		enemy = body
		track_enemy = true
		print("enter")

func _on_arrow_path_body_exited(body):
	if body.is_in_group("Enemies"):
		track_enemy = false
		print("exit")

func _on_arrow_hitbox_body_entered(body):
	if body.is_in_group("Enemies"):
		visible = false
		print("exit2")
