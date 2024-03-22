extends CharacterBody2D
@onready var diable_sprite = $diableSprite

var death = preload("res://Scenes/enemy/death.tscn")

@export var health = 25
var speed = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y += speed * delta
	diable_sprite.play("default")
	dieDiable()
	
func _on_hurtbox_area_entered(area):
	if(area.get_parent().has_method("getDamageAmount")):
		var node = area.get_parent() as Node
		health -= node.damageBullet
	if(area.get_parent().has_method("getWaveDamage")):
		var node = area.get_parent() as Node
		health -= node.damageWave
	if(area.get_parent().has_method("isPlayer")):
		queue_free()

func dieDiable():
	if(health <= 0):
		var deathInstance = death.instantiate() as Node2D
		deathInstance.global_position = global_position
		get_parent().add_child(deathInstance)
		queue_free()
