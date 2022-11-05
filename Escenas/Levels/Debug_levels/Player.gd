extends KinematicBody2D

const SPEED = 128
const FLOOR = Vector2(0, -1)
const GRAVITY = 13
const JUMP_HEIGHT = 240
onready var motion = Vector2.ZERO
var health : int = 120




func _process(_delta):
	motion_ctrl()
	
	
	


func get_axis() -> Vector2:
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")) 
	return axis 


func motion_ctrl():
	motion.y += GRAVITY
	
	if get_axis().x == 1:
		$AnimatedSprite.flip_h = false
	elif get_axis().x == -1:
		$AnimatedSprite.flip_h = true
	
	if get_axis().x != 0:
		motion.x =  get_axis().x * SPEED
	else:
		motion.x = 0
	
	if is_on_floor():
		if get_axis().x != 0:
			$AnimatedSprite.play("caminar") 
		else:
			$AnimatedSprite.play("quieto")
		
		if Input.is_action_just_pressed("ui_accept"):
			motion.y -= JUMP_HEIGHT
	else:
		if motion.y < 0:
			$AnimatedSprite.play("salto") 
		else:
			$AnimatedSprite.play("caer") 
	 
	motion = move_and_slide(motion, FLOOR)


		
func damage_player(damage):
	health -= damage


func _on_Dano_area_entered(area):
	if area.get_parent().is_in_group("enemigos"):
		damage_player(area.get_parent().damage) 
