extends Area2D

var carro_na_calcada = false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if "velocidade_atual" in body:
		carro_na_calcada = true
		GerenciadorInfracoes.registrar_infracao("calcada")

func _on_body_exited(body):
	if "velocidade_atual" in body:
		carro_na_calcada = false
