extends Area2D

@export var limite_da_placa: int = 40

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if "limite_via_kmh" in body:
		body.limite_via_kmh = limite_da_placa
		body.falta_velocidade_registrada = false
