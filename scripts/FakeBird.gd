extends RigidBody2D

onready var play_voa = get_node("SomVoa")
onready var flyTimer = get_node("FlySound")

var scene

func _ready():
	scene = get_tree().get_current_scene()
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("touch"):
		on_touch()

func on_touch():
	if (scene.estado == scene.JOGANDO):
		PlayStop_FlySound()
		apply_impulse(Vector2(0, 0), Vector2(0, -1000))

func _on_FlySound_timeout():
	play_voa.stop()
	
func PlayStop_FlySound():
	play_voa.play()
	flyTimer.start()
