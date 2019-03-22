extends Node2D

onready var character = get_node("FakeBird")
onready var background = get_node("Background")
onready var timereplay = get_node("TimeToReplay")
onready var placar = get_node("Placar/Control/Pontuacao")

#Timers para os sons
onready var deathSound = get_node("Morte_SoundRepeat")
onready var scoreSound = get_node("Ponto_SoundRepeat")

#Sons
onready var morte = get_node("SomMorte")
onready var ponto = get_node("SomPonto")

var pontos = 0
var estado = 1

const JOGANDO = 1
const PERDEU = 2

func _ready():
	pass
	
func kill():
	character.apply_impulse(Vector2(0,0), Vector2(-1000,0))
	PlayStop_SoundMorte()
	background.stop()
	get_node("Background/BackSound").stop()
	estado = PERDEU
	timereplay.start()
	
func PlayStop_SoundMorte():
	morte.play()
	deathSound.start()

func PlayStop_SoundPonto():
	ponto.play()
	scoreSound.start()
	
func pontua():
	PlayStop_SoundPonto()
	pontos += 1
	placar.set_text(str(pontos))

func _on_TimeToReplay_timeout():
	get_tree().reload_current_scene()


func _on_Ponto_SoundRepeat_timeout():
	ponto.stop()


func _on_Morte_SoundRepeat_timeout():
	morte.stop()


func _on_Background_animation_finished(anim_name):
	anim_name.stop(true)


func _on_Background_ready():
	get_node("Background/BackSound").play()
