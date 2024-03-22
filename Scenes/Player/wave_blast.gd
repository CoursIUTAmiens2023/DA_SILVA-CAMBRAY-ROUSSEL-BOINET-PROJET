extends AnimatedSprite2D

var speed : int = 600
var direction : int = -1
var damageWave : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_local_x(direction*speed*delta)



func _on_timer_timeout():
	queue_free()


func _on_hit_box_area_entered(area):
	pass # Replace with function body.


func _on_hit_box_body_entered(body):
	pass # Replace with function body.

func getWaveDamage() -> int :
	return damageWave
