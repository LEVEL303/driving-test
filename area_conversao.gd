extends Area2D

var carro_na_area = null
var rotacao_inicial: float = 0.0
var seta_inicial: String = "desligada"

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if "estado_seta" in body:
		carro_na_area = body
		rotacao_inicial = body.rotation
		seta_inicial = body.estado_seta

func _on_body_exited(body):
	if body == carro_na_area:
		var diferenca_rotacao = wrapf(body.rotation - rotacao_inicial, -PI, PI)
		
		var virou_esquerda = diferenca_rotacao < -0.3
		var virou_direita = diferenca_rotacao > 0.3
		var seguiu_reto = not virou_esquerda and not virou_direita
		
		var infração = false
		
		# 1. Virou para qualquer lado sem dar seta
		if seta_inicial == "desligada" and not seguiu_reto:
			infração = true
		elif seta_inicial != "desligada" and seguiu_reto:
			infração = true
		elif (seta_inicial == "esquerda" and virou_direita) or (seta_inicial == "direita" and virou_esquerda):
			infração = true
			
		if infração:
			print("Falta registrada: Uso incorreto das setas / Sinalização de conversão!")
			
		carro_na_area = null
