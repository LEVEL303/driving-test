extends Area2D

var falta_registrada = false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if "velocity" in body and not falta_registrada:
		if body.velocity.normalized().dot(global_transform.x) < -0.2:
			GerenciadorInfracoes.registrar_infracao("contramao")
			falta_registrada = true

func _on_body_exited(_body):
	falta_registrada = false
