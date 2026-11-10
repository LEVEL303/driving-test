extends Node

var pontuacao_total: int = 0
var historico_infracoes: Array = []
var prova_finalizada: bool = false

const CADASTRO_INFRACOES = {
	"parada_obrigatoria": {
		"nome": "Não respeitou a parada obrigatória",
		"descricao": "O jogador não parou completamente o veículo diante da sinalização de parada obrigatória.",
		"classificacao": "Gravíssima",
		"penalidade": 6
	},
	"velocidade_40": {
		"nome": "Ultrapassou o limite de velocidade de 40 km/h",
		"descricao": "O jogador trafegou acima de 40 km/h em uma via com esse limite.",
		"classificacao": "Grave",
		"penalidade": 4
	},
	"velocidade_60": {
		"nome": "Ultrapassou o limite de velocidade de 60 km/h",
		"descricao": "O jogador trafegou acima de 60 km/h em uma via com esse limite.",
		"classificacao": "Grave",
		"penalidade": 4
	},
	"contramao": {
		"nome": "Dirigiu na contramão",
		"descricao": "O jogador conduziu o veículo no sentido contrário ao permitido para a via.",
		"classificacao": "Grave",
		"penalidade": 4
	},
	"setas_bifurcacao": {
		"nome": "Uso inadequado das setas",
		"descricao": "O jogador não fez uso adequado das setas na hora de indicar sua ação em uma bifurcação.",
		"classificacao": "Grave",
		"penalidade": 4
	},
	"sinal_vermelho": {
		"nome": "Passou no sinal vermelho",
		"descricao": "O jogador avançou o sinal vermelho do semáforo.",
		"classificacao": "Gravíssima",
		"penalidade": 6
	},
	"calcada": {
		"nome": "Dirigiu sobre a calçada",
		"descricao": "O jogador conduziu o veículo sobre a calçada, destinada à circulação de pedestres.",
		"classificacao": "Gravíssima",
		"penalidade": 6
	},
	"saida_vaga": {
		"nome": "Não sinalizou ao sair da vaga",
		"descricao": "O jogador não sinalizou, com a seta esquerda, a saída da vaga do estacionamento.",
		"classificacao": "Grave",
		"penalidade": 4
	},
	"entrada_vaga": {
		"nome": "Não sinalizou ao entrar na vaga",
		"descricao": "O jogador não sinalizou, com a seta direita, a entrada na vaga do estacionamento.",
		"classificacao": "Grave",
		"penalidade": 4
	}
}

func registrar_infracao(chave: String) -> void:
	if prova_finalizada:
		return
	if CADASTRO_INFRACOES.has(chave):
		var inf = CADASTRO_INFRACOES[chave]
		pontuacao_total += inf.penalidade
		historico_infracoes.append(inf)
		print("Falta registrada: ", inf.nome, " | Penalidade: +", inf.penalidade, " pontos (Total acumulado: ", pontuacao_total, ")")

func finalizar_prova() -> void:
	if prova_finalizada:
		return
	prova_finalizada = true
	
	print("\n--- FIM DA PROVA PRÁTICA ---")
	print("Total de pontos de penalização acumulados: ", pontuacao_total)
	
	if pontuacao_total <= 10:
		print("Resultado: APROVADO! (Pontuação dentro do limite permitido)")
	else:
		print("Resultado: REPROVADO! (Ultrapassou o limite de 10 pontos)")
	print("-----------------------------\n")
