class_name Agent
extends Node2D

var dados: AgenteData
var grid_pos:Vector2i = Vector2i(1,1)
signal grid_pos_alterada(agente:Agent, nova_posicao:Vector2i)

func carregar_dados(data: AgenteData) -> void:
	if data == null:
		push_error("Nenhum dado fornecido!")
		return
	
	dados = data
	$AnimatedSprite2D.animation = dados.tipo 
	$AnimatedSprite2D.play()
	
	grid_pos.x = dados.grid_pos.x
	grid_pos.y = dados.grid_pos.y
	
	print(dados.nome, dados.grid_pos)

func atualizar_grid_pos(nova_pos: Vector2i) -> void:
	grid_pos = nova_pos
	
	# Atualiza a posição visual no mundo
	position.x = 0 + 16 * grid_pos.x - 16
	position.y = 0 + 16 * grid_pos.y - 16
	
	# Emite o sinal para o CoordManager
	grid_pos_alterada.emit(self, grid_pos)


func atacar() -> void:
	print("Agente realizando ataque genérico!")
	

	
