# Driving Test

Simulador 2D de prova prática de direção desenvolvido na **Godot Engine 4** com **GDScript**. O jogador parte do estacionamento, percorre o trajeto seguindo a sinalização viária e as placas indicativas de rota, respeita limites de velocidade, paradas obrigatórias, semáforos e uso de setas, e retorna à vaga para encerrar a avaliação.

## Como foi feito

A arquitetura separa interface, regras de trânsito e estado da prova em cenas e scripts modulares. Um nó global (`Autoload`) centraliza o cadastro das infrações, o cálculo da pontuação de penalidades e o histórico do que ocorreu durante a partida, definindo aprovação para até 10 pontos e reprovação a partir de 11.

As áreas de detecção (`Area2D`) monitoram o comportamento do veículo em trechos específicos — como conversões, entradas e saídas de vaga e demais regras da pista — enquanto a interface organiza a tela inicial, a tela de instruções e a tela de resultado com detalhamento das infrações cometidas.

## Como executar

Os executáveis prontos ficam na pasta `executaveis/` do repositório, sem necessidade de instalar a Godot Engine.

### Windows

Acesse a pasta `executaveis/Windows/` e execute `Driving Test.exe` (com um duplo clique no explorador de arquivos ou pelo prompt de comando).

### Linux

Abra um terminal na pasta `executaveis/Linux/`, garanta permissão de execução ao binário e rode o jogo:

```bash
chmod +x "Driving Test.x86_64"
./"Driving Test.x86_64"
