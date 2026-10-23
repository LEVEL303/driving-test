extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if "velocidade_atual" in body and body.velocidade_atual > 0:
		if body.estado_seta != "direita":
			print("Falta registrada: Entrou na vaga sem sinalizar para a direita!")

func _on_body_exited(body):
	if "velocidade_atual" in body and body.velocidade_atual < 0:
		if body.estado_seta != "esquerda":
			print("Falta registrada: Saiu da vaga em ré sem sinalizar para a esquerda!")
