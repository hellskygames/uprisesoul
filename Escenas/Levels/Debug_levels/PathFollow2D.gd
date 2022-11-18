extends PathFollow2D


onready var animationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animationPlayer.play("horizontal")
	animationPlayer.play("moving")
	animationPlayer.play("verticalbajo")
	animationPlayer.play("movimiento")
	
pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
