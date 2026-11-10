extends Control

@onready var botao_voltar = $BotaoVoltar

func _ready() -> void:
	if botao_voltar:
		botao_voltar.pressed.connect(_on_botao_voltar_pressed)

func _on_botao_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://menu_principal.tscn")
