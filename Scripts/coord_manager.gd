extends Node2D

@export var lista_coords: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func registrar_posicao_agente(agente: Node, nova_posicao: Vector2i) -> void:
	lista_coords[agente] = nova_posicao
	print("CoordManager: ", agente.name, " movido/registrado na posição ", nova_posicao)

func obter_agente_na_posicao(posicao_alvo: Vector2i) -> Node:
	for agente in lista_coords:
		if lista_coords[agente] == posicao_alvo:
			return agente
	return null
