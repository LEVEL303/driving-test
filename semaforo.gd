extends Area2D

@onready var luz_vermelha = $ColorRect/Vermelho
@onready var luz_amarela = $ColorRect/Amarelo
@onready var luz_verde = $ColorRect/Verde
@onready var timer = $Timer

var estado_atual = "verde"

func _ready():
	timer.timeout.connect(_on_timer_timeout)
	body_entered.connect(_on_body_entered)
	mudar_estado("verde")

func mudar_estado(novo_estado):
	estado_atual = novo_estado
	
	luz_vermelha.color = Color(0.3, 0.0, 0.0)
	luz_amarela.color = Color(0.3, 0.3, 0.0)
	luz_verde.color = Color(0.0, 0.3, 0.0)
	
	if estado_atual == "verde":
		luz_verde.color = Color(0.0, 1.0, 0.0)
		timer.wait_time = 5.0
	elif estado_atual == "amarelo":
		luz_amarela.color = Color(1.0, 1.0, 0.0)
		timer.wait_time = 2.0
	elif estado_atual == "vermelho":
		luz_vermelha.color = Color(1.0, 0.0, 0.0)
		timer.wait_time = 5.0
		
	timer.start()

func _on_timer_timeout():
	if estado_atual == "verde":
		mudar_estado("amarelo")
	elif estado_atual == "amarelo":
		mudar_estado("vermelho")
	elif estado_atual == "vermelho":
		mudar_estado("verde")

func _on_body_entered(body):
	if estado_atual == "vermelho":
		GerenciadorInfracoes.registrar_infracao("sinal_vermelho")
