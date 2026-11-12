extends Control

@onready var label_resultado = $VBoxContainer/LabelResultado
@onready var label_pontuacao = $VBoxContainer/LabelPontuacao
@onready var container_infracoes = $VBoxContainer/ColorRect/ScrollContainer/ListaInfracoes
@onready var botao_retornar = $BotaoRetornar

func _ready() -> void:
	botao_retornar.pressed.connect(_on_botao_retornar_pressed)
	
	if GerenciadorInfracoes.pontuacao_total <= 10:
		label_resultado.text = "APROVADO"
		label_resultado.add_theme_color_override("font_color", Color(0.0, 0.8, 0.3))
	else:
		label_resultado.text = "REPROVADO"
		label_resultado.add_theme_color_override("font_color", Color(0.9, 0.2, 0.2))
		
	label_pontuacao.text = "Total de Penalizações: " + str(GerenciadorInfracoes.pontuacao_total) + " pontos"
	
	# Limpa qualquer elemento anterior
	for filho in container_infracoes.get_children():
		filho.queue_free()
		
	if GerenciadorInfracoes.historico_infracoes.is_empty():
		var lbl = Label.new()
		lbl.text = "Nenhuma infração cometida!"
		container_infracoes.add_child(lbl)
	else:
		for inf in GerenciadorInfracoes.historico_infracoes:
			var lbl = Label.new()
			lbl.text = inf.nome + " | " + inf.classificacao + " (+" + str(inf.penalidade) + " pts)\n" + inf.descricao + "\n"
			lbl.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			container_infracoes.add_child(lbl)

func _on_botao_retornar_pressed() -> void:
	GerenciadorInfracoes.reiniciar_dados()
	get_tree().change_scene_to_file("res://menu_principal.tscn")
