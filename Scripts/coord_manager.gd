extends Node2D

@export var lista_coords:Array[Vector2i] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func registrar_posicao_agente(agente: Node, nova_posicao: Vector2i) -> void:
	lista_coords[agente] = nova_posicao
	print("CoordManager: ", agente.name, " movido/registrado na posição ", nova_posicao)
