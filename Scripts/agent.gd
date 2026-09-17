class_name Agent
extends Node2D

var dados: AgenteData
signal grid_pos_alterada(nova_posicao:Vector2i)

func carregar_dados(data: AgenteData) -> void:
	if data == null:
		push_error("Nenhum dado fornecido!")
		return
	
	dados = data
	$AnimatedSprite2D.animation = dados.tipo 
	$AnimatedSprite2D.play()
	
	print(dados.nome, dados.grid_pos)


func atacar() -> void:
	print("Agente realizando ataque genérico!")
	

	
