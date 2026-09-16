extends Node

var player_captain:String = ""
var contratos:Array[AgenteData] = []
var inventario:Array[Resource] = []

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass	
	
func adicionar_contrato(agente: AgenteData) -> void:
	var novo_agente = agente.duplicate()
	contratos.append(novo_agente)

func atribuir_item(agente:AgenteData, item:Resource) -> void:
	if item in inventario:
		agente.itens_equipados.append(item)
		inventario.erase(item)
		
		
