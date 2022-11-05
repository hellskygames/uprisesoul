extends KinematicBody2D

export (int) var damage = 20

onready var hitbox = $Hitbox

const MAX_SPEED : float = 100.0
const GRAVITY : float = 25.0

var motion := Vector2()


func _ready():
	$AnimatedSprite.scale.x = -1
	motion.x = MAX_SPEED

func _physics_process(_delta):
	motion.y += GRAVITY
	_move()

	motion = move_and_slide(motion)
	
func _next_to_left_wall() -> bool:
	return $LeftRay.is_colliding()

func _next_to_right_wall() -> bool:
	return $RightRay.is_colliding()

func _floor_detection() -> bool:
	return $AnimatedSprite/FloorDetection.is_colliding()

func _flip():
	motion.x *= -1
	$AnimatedSprite.scale.x *= -1

func _move():
	if _next_to_right_wall() or _next_to_left_wall() or !_floor_detection():
		_flip()
	
	
func _on_obstaculos_area_entered(area):
	
	if area.is_in_group("obstaculos"):
		get_tree().reload_current_scene()

