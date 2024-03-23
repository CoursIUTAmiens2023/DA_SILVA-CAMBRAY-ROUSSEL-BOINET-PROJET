extends CharacterBody2D
@onready var phantom_sprite = $phantomSprite

var death = preload("res://Scenes/enemy/death.tscn")

@export var health = 100
var speed = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y += speed * delta
	phantom_sprite.play("default")
	diePhantom()


func _on_hurt_box_area_entered(area):
	if(area.get_parent().has_method("getDamageAmount")):
		var node = area.get_parent() as Node
		health -= node.damageBullet
	if(area.get_parent().has_method("getWaveDamage")):
		var node = area.get_parent() as Node
		health -= node.damageWave
	if(area.get_parent().has_method("isPlayer")):
		queue_free()

func diePhantom():
	if(health <= 0):
		var deathInstance = death.instantiate() as Node2D
		deathInstance.global_position = global_position
		get_parent().add_child(deathInstance)
		queue_free()
