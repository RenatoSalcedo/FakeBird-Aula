extends Node2D

export var speed = -400
var scene 

func _ready():
	scene = get_tree().get_current_scene()
	set_process(true)

func _process(delta):
	if (scene.estado == scene.JOGANDO):
		position = (position + Vector2(speed * delta, 0))
	
	if (position.x < -100):
		queue_free()
	

func _on_AreaCano_body_entered(body):
	if (body.get_name() == "FakeBird"):
		get_node("Ponto/Ring").stop()
		scene.kill()

func _on_Ponto_body_entered(body):
	if (body.get_name() == "FakeBird"):
		scene.pontua()
