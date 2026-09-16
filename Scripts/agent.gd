extends Node2D

var grid_pos: Vector2i = Vector2i(0,0)
var nome: String = ""
var hp_max: int = 10
var hp_atual: int = 10
var speed: int = 1
var damage: int = 3
var tipo: String = ""
var cena_agente: PackedScene
var itens_equipados: Array[Resource] = []

func carregar_dados(data: AgenteData) -> void:
	if data == null:
		push_error("Nenhum dado de agente foi fornecido!")
		return
		
	grid_pos = data.grid_pos
	nome = data.nome
	hp_max = data.hp_max
	hp_atual = data.hp_atual
	speed = data.speed
	damage = data.damage
	tipo = data.tipo
	cena_agente = data.cena_agente
	itens_equipados = data.itens_equipados

	position.x = grid_pos.x * 16 
	position.y == grid_pos.y * 16

	

	
