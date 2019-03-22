extends Position2D

onready var cano = preload("res://scenes/Cano.tscn")

func _ready():
	randomize() 

func _on_Timer_timeout():
	var ncano = cano.instance()
	ncano.speed = -400
	ncano.position = position + Vector2(0,rand_range(-500, 500))
	self.owner.add_child(ncano)
