extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D



enum State {Idle, Fly}
var currentState
@export var speed = 300

func _ready():
	currentState = State.Idle
	
func _physics_process(delta):
	playerFly(delta)
	playerAnimation()
	
	
func playerFly(delta):
	var currentDirection = "none"
	if Input.is_action_pressed("move_down"):
		currentDirection = "down"
		currentState = State.Fly
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("move_up"):
		currentDirection = "up"
		currentState = State.Fly
		velocity.x = 0
		velocity.y = -speed
	elif Input.is_action_pressed("move_left"):
		currentDirection = "left"
		currentState = State.Fly
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("move_right"):
		currentDirection = "right"
		currentState = State.Fly
		velocity.x = speed
		velocity.y = 0
	else:
		currentDirection = "none"
		currentState = State.Idle
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func playerAnimation():
	if(currentState == State.Idle):
		animated_sprite_2d.play("standBy")
	elif (currentState == State.Fly):
		animated_sprite_2d.play("fly")
