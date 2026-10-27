extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if "velocidade_atual" in body and body.velocidade_atual > 0:
		if body.estado_seta != "direita":
			GerenciadorInfracoes.registrar_infracao("entrada_vaga")

func _on_body_exited(body):
	if "velocidade_atual" in body and body.velocidade_atual < 0:
		if body.estado_seta != "esquerda":
			GerenciadorInfracoes.registrar_infracao("saida_vaga")
