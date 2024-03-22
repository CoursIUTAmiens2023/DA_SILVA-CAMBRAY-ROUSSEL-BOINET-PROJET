extends AnimatedSprite2D
@onready var death = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	death.play("default")


func _on_timer_timeout():
	queue_free()
