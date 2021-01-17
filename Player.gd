extends KinematicBody2D

var direction = 0
var velocity: = Vector2()
const SPEED = 400
const GRAVITY = 100
const JUMP = 1200

func _ready():
	pass 



func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		direction = 1
	elif Input.is_action_pressed("ui_left"):
		direction = -1
	else:
		  direction = 0
		
	if Input.is_action_just_pressed("ui_select"):
		if.is_on_floor():
			velocity.y += -JUMP
		
	velocity.y += GRAVITY
		
	velocity.x = direction * SPEED 
	velocity = move_and_slide(velocity, Vector2.UP)
	update_animation()
	
func update_animation():
	if is_on_floor():
		if direction == 1:
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("walk")
		elif direction == -1:
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("walk")
		else:
			$AnimatedSprite.play("ıdle")
	else:
		$AnimatedSprite.play("Jump")
		
	if $AnimatedSprite.flip_h == false and $AnimatedSprite.offset.x < 0:
		$AnimatedSprite.offset *=  -1
	
