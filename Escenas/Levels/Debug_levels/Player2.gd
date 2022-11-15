extends KinematicBody2D
const SPEED = 128
const FLOOR = Vector2( 0, -1)
const GRAVITY = 16
const JUMP_HEIGHT = 280
const CAST_ENEMTY= 10
onready var motion: Vector2 = Vector2.ZERO
var can_move: bool


""" STATE HACHINE """
var playback : AnimationNodeStateMachinePlayback


func _ready():
	playback = $AnimationTree.get("parameters/playback")
	playback.start("quieto")
	$AnimationTree.active = true

func _process(delta):
	motion_ctrl()
	direction_ctrl()
	jump_ctrl()
	attack_ctrl()
	
func get_axis() -> Vector2:
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	return axis
	
	
func motion_ctrl():
	motion.y += GRAVITY
	
	if can_move:
		motion.x = get_axis().x * SPEED
		
		if get_axis().x == 0:
			playback.travel("quieto")
		else:
			playback.travel("caminar")
			
		match playback.get_current_node():
			"quieto":
				motion.x =0
				$Particles .emitting = false
			"caminar":
				$Particles.emitting = true
				
				
		if get_axis().x == 1:
			$Sprite.flip_h = false
		elif get_axis().x == -1:
			$Sprite.flip_h = true
	motion= move_and_slide(motion, FLOOR)

func direction_ctrl():
	match $Sprite.flip_h:
		true:
			$RayEnemy.cast_to.x = -CAST_ENEMTY
		false:
			$RayEnemy.cast_to.x = CAST_ENEMTY
			

func jump_ctrl():
	match is_on_floor():
		true:
			can_move = true
			
			if Input.is_action_just_pressed("ui_accept"):
				playback.travel("salto")
				motion.y -= JUMP_HEIGHT
				
		false:
			$Particles.emitting = false
			
			if motion.y <0:
				playback.travel("salto")
			else:
				playback.travel("caer")
				
func attack_ctrl():
	if Input.is_action_pressed("hit"):
			match playback.get_current_node():
				"quieto":
					playback.travel("ataque")
				"ataque":
					playback.travel("ataque")
				
					
	
	
	if playback.get_current_node() == "ataque":
		$RayEnemy.enabled = true
	else:
		$RayEnemy.enabled = false
		
	var col = $RayEnemy.get_collider()
	
	if $RayEnemy.is_colliding() and col.is_in_group("Enemy"):
		col.queue_free()
		






func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		get_tree().reload_current_scene()
