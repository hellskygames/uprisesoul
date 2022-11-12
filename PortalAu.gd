extends Area2D

export (String) var escena


func _on_PortalAu_body_entered(bodyy):
	if bodyy.name == "Player":
		get_tree().change_scene("res://Escenas/Levels/Debug_levels/"+escena+".tscn")
