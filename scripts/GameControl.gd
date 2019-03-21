extends Node2D

onready var character = get_node("FakeBird")

var pontos = 0
var estado = 1

const JOGANDO = 1
const PERDENDO = 2

func _ready():
	estado = JOGANDO
	
func kill():
	character.apply_impulse(Vector2(0, 0), Vector2(-1000, 0))
	get_node("FakeBird/FakeBirdAnim").stop()
	estado = PERDENDO