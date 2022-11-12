extends Area2D

export (String) var escena


func _on_Portal_body_entered(body):
	if body.name == "Player":
		if Input.is_key_pressed(KEY_TAB):
			get_tree().change_scene("res://Escenas/Levels/Debug_levels/"+escena+".tscn")
	pass # Replace with function body.

