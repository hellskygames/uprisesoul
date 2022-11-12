extends Area2D

export var pixelesPorSegundo : int = 180

var TiempoHastaDisparo = 2.0
var TiempoPorcadaDisparo = 2.0 


func _ready():
	pass 


func _process(delta): 
	TiempoHastaDisparo += delta
	position.x += pixelesPorSegundo * delta
	
	if position.x < 0:
		queue_free()
