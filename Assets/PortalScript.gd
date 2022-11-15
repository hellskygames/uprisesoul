extends Area2D

export (String) var escena


func _on_Portal_body_entered(body):
<<<<<<< HEAD
	if body.name == "Player":
		if Input.is_action_just_pressed("ui_left"):
=======
	if Input.is_action_pressed("ui_focus_next"):
		if body.name == "Player":
>>>>>>> origin/player2
			get_tree().change_scene("res://Escenas/Levels/Debug_levels/"+escena+".tscn")
	pass # Replace with function body.
	
