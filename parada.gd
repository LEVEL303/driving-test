extends Area2D

var carro_na_area = null
var parou = false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _physics_process(_delta):
	if carro_na_area:
		if carro_na_area.velocity.length() < 5.0:
			parou = true

func _on_body_entered(body):
	carro_na_area = body
	parou = false

func _on_body_exited(_body):
	if not parou:
		GerenciadorInfracoes.registrar_infracao("parada_obrigatoria")
	carro_na_area = null
