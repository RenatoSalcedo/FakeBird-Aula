extends Node2D

export var speed = -400

func _ready():
	set_process(true)
	pass

func _process(delta):
	position = (position + Vector2(self.speed * delta, 0))
	
	if position.x < -100:
		queue_free()