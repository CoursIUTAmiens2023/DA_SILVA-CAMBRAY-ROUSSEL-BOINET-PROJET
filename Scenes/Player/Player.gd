extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var muzzle : Marker2D = $Muzzle

var bullet = preload("res://Scenes/Player/bullet.tscn")

enum State {Idle, Fly, Shoot}
var currentState
var muzzlePosition

@export var speed = 400
@export var health = 3

func _ready():
	currentState = State.Idle
	muzzlePosition = muzzle.position
	
func _physics_process(delta):
	playerFly(delta)
	playerAnimation()
	playerShooting(delta)
	die()
	
	
func playerFly(delta):
	if Input.is_action_pressed("move_down"):
		currentState = State.Fly
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("move_up"):
		currentState = State.Fly
		velocity.x = 0
		velocity.y = -speed
	elif Input.is_action_pressed("move_left"):
		currentState = State.Fly
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("move_right"):
		currentState = State.Fly
		velocity.x = speed
		velocity.y = 0
	else:
		currentState = State.Idle
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func playerAnimation():
	if(currentState == State.Idle):
		animated_sprite_2d.play("standBy")
	elif (currentState == State.Fly):
		animated_sprite_2d.play("fly")
		
func playerShooting(delta):
	if (Input.is_action_just_pressed("shoot")):
		currentState = State.Shoot
		var bulletInstance = bullet.instantiate() as Node2D
		bulletInstance.global_position = muzzle.global_position
		get_parent().add_child(bulletInstance)
	
	if (Input.is_action_pressed("rayshoot")):
		currentState = State.Shoot
		var bulletInstance = bullet.instantiate() as Node2D
		bulletInstance.global_position = muzzle.global_position
		get_parent().add_child(bulletInstance)

func die():
	if(health <= 0):
		queue_free()


func _on_hurtbox_area_entered(area):
	health -= 1

func isPlayer():
	return true
	
func getHealth() -> int:
	return health
