extends Node2D

func _ready():
	pass # Replace with function body.

func _on_obstaculos_area_entered(area):
	
	if area.is_in_group("obstaculos"):
		get_tree().reload_current_scene()
		
