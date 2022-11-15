extends Area2D

export (String) var escena

func _on_portall_body_entered(bodyy):
	if bodyy.name == "Player":
			get_tree().change_scene("res://Escenas/Levels/Debug_levels/Menu.tscn.tscn")
	pass # Replace with function body.
