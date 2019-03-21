extends Node2D

export var speed = -400
var scene 

func _ready():
	scene = get_tree().get_current_scene()
	set_process(true)

func _process(delta):
	position = (position + Vector2(self.speed * delta, 0))
	
	if position.x < -100:
		queue_free()
	
	
func _on_body_crash(body):
	if body.get_name() == "FakeBird":
		scene.kill()