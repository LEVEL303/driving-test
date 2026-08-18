extends CharacterBody2D

@export var aceleracao: float = 120.0
@export var forca_freio: float = 400.0
@export var friccao: float = 80.0
@export var velocidade_curva: float = 3.0
@export var suavidade_curva: float = 2.0
@export var imagem_seta: Texture2D

var limite_kmh: int = 100
var velocidade_maxima: float = 500.0
var velocidade_atual: float = 0.0
var direcao_atual: float = 0.0
var estado_seta: String = "desligada"

@onready var label_velocidade = $CanvasLayer/LabelVelocidade
@onready var icone_seta_esq = $CanvasLayer/TextureRectEsq
@onready var icone_seta_dir = $CanvasLayer/TextureRectDir

func _ready() -> void:
	icone_seta_esq.texture = imagem_seta
	icone_seta_dir.texture = imagem_seta
	icone_seta_dir.flip_h = true

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_2: limite_kmh = 20
			KEY_3: limite_kmh = 30
			KEY_4: limite_kmh = 40
			KEY_5: limite_kmh = 50
			KEY_6: limite_kmh = 60
			KEY_8: limite_kmh = 80
			KEY_0: limite_kmh = 100
		velocidade_maxima = limite_kmh * 5.0

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("acelerar"):
		if velocidade_atual < 0.0:
			velocidade_atual = move_toward(velocidade_atual, 0.0, forca_freio * delta)
		else:
			velocidade_atual = move_toward(velocidade_atual, velocidade_maxima, aceleracao * delta)
	elif Input.is_action_pressed("frear"):
		if velocidade_atual > 0.0:
			velocidade_atual = move_toward(velocidade_atual, 0.0, forca_freio * delta)
		else:
			velocidade_atual = move_toward(velocidade_atual, -200.0, aceleracao * delta)
	else:
		velocidade_atual = move_toward(velocidade_atual, 0.0, friccao * delta)
		
	var direcao_alvo = Input.get_axis("esquerda", "direita")
	direcao_atual = move_toward(direcao_atual, direcao_alvo, suavidade_curva * delta)
		
	if abs(velocidade_atual) > 5.0:
		var direcao_aplicada = direcao_atual
		if velocidade_atual < 0:
			direcao_aplicada = -direcao_aplicada
		rotation += direcao_aplicada * velocidade_curva * delta
		
	if Input.is_action_just_pressed("seta_esquerda"):
		estado_seta = "desligada" if estado_seta == "esquerda" else "esquerda"
	elif Input.is_action_just_pressed("seta_direita"):
		estado_seta = "desligada" if estado_seta == "direita" else "direita"
		
	velocity = Vector2.UP.rotated(rotation) * velocidade_atual
	move_and_slide()
	
	var velocidade_kmh = abs(velocidade_atual) * 0.2
	label_velocidade.text = str(int(velocidade_kmh)) + " km/h (Max: " + str(limite_kmh) + ")"
	
	icone_seta_esq.modulate = Color(1, 1, 1, 1) if estado_seta == "esquerda" else Color(0.2, 0.2, 0.2, 1)
	icone_seta_dir.modulate = Color(1, 1, 1, 1) if estado_seta == "direita" else Color(0.2, 0.2, 0.2, 1)
