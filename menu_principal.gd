extends Control

@onready var botao_iniciar = $VBoxContainer/BotaoIniciar
@onready var botao_instrucoes = $VBoxContainer/BotaoInstrucoes
@onready var botao_sair = $VBoxContainer/BotaoSair
@onready var janela_confirmacao = $ConfirmationDialog

func _ready() -> void:
	botao_iniciar.pressed.connect(_on_botao_iniciar_pressed)
	botao_instrucoes.pressed.connect(_on_botao_instrucoes_pressed)
	botao_sair.pressed.connect(_on_botao_sair_pressed)
	janela_confirmacao.confirmed.connect(_on_confirmacao_sair_confirmed)

func _on_botao_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://principal.tscn")

func _on_botao_instrucoes_pressed() -> void:
	get_tree().change_scene_to_file("res://tela_instrucoes.tscn")

func _on_botao_sair_pressed() -> void:
	janela_confirmacao.dialog_text = "Deseja realmente sair do jogo?"
	janela_confirmacao.popup_centered()

func _on_confirmacao_sair_confirmed() -> void:
	get_tree().quit()
