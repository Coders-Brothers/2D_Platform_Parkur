extends KinematicBody2D

var direction = 0
var velocity: = Vector2()
const SPEED = 400
const GRAVITY = 100
const JUMP = 1100

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
	velocity = move_and_slide(velocity, Vector2(0,-1))
