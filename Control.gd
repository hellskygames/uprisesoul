extends Control

func _on_JUGAR_pressed():
	get_tree().change_scene("res://Escenas/Levels/Debug_levels/Nivel1.tscn")
	


func _on_SALIR_pressed():
	get_tree().quit()
	
