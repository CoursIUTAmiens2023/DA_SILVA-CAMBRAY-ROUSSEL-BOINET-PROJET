extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var muzzle : Marker2D = $Muzzle


var fireball = preload("res://Scenes/Player/bullet.tscn")
var baseWave = preload("res://Scenes/Player/base_wave.tscn")
var waveBlast = preload("res://Scenes/Player/wave_blast.tscn")

enum State {Idle, Fly, Shoot}
var currentState
var muzzlePosition
var cooldoonShoot : bool = false

@export var speed = 400
@export var health = 3

func _ready():
	currentState = State.Idle
	muzzlePosition = muzzle.position
	
func _physics_process(delta):
	playerFly(delta)
	playerAnimation()
	playerShooting(delta)
	diePlayer()
	
	
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
	if (Input.is_action_just_pressed("shoot") && !cooldoonShoot):
		currentState = State.Shoot
		var fireballInstance = fireball.instantiate() as Node2D
		fireballInstance.global_position = muzzle.global_position
		get_parent().add_child(fireballInstance)
		cooldoonShoot = true
	
	if (Input.is_action_pressed("rayshoot")):
		currentState = State.Shoot
		var baseWaveInstance = baseWave.instantiate() as Node2D
		baseWaveInstance.global_position = muzzle.global_position
		get_parent().add_child(baseWaveInstance)
		var waveBlastInstance = waveBlast.instantiate() as Node2D
		waveBlastInstance.global_position = muzzle.global_position
		get_parent().add_child(waveBlastInstance)

func diePlayer():
	if(health <= 0):
		queue_free()


func _on_hurtbox_area_entered(area):
	health -= 1

func isPlayer():
	return true
	
func getHealth() -> int:
	return health

func getCooldownShoot() -> bool:
	return cooldoonShoot

func _on_shoot_cooldown_timeout():
	cooldoonShoot = false
