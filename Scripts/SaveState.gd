extends Node

var save_path ="user://save_game.save"

var variable =1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func save_game():
	var save_file = FileAccess.open(save_path, FileAccess.WRITE)
	save_file.store_var(variable)
	
	

func load_data():
	if FileAccess.file_exists(save_path):
		var file =FileAccess.open(save_path, FileAccess.READ)
		variable = file.get_var(variable)
	else:
		print("nodate")
		variable =0
