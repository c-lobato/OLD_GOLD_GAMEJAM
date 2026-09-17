extends Node

var player_captain:String = ""
var contratos:Array[AgenteData] = []
var contratos_equipados_grid:Array[AgenteData] = []
var inventario:Array[Resource] = []
var ouro:int = 0

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass	
	
func adicionar_contrato(agente: AgenteData) -> void:
	var novo_agente = agente.duplicate()
	contratos.append(novo_agente)
	
func remover_contrato(agente: AgenteData) -> void:
	contratos.erase(agente)

func adicionar_contrato_grid(agente: AgenteData) -> void:
	if agente in contratos:
		contratos_equipados_grid.append(agente)
		remover_contrato(agente)
	else:
		print("Erro: Agente não encontrado nos contratos")
func atribuir_item(agente:AgenteData, item:Resource) -> void:
	if item in inventario:
		agente.itens_equipados.append(item)
		inventario.erase(item)

func ganhar_ouro(quantidade:int) -> void:
	ouro += quantidade

func perder_ouro(quantidade:int) -> void:
	ouro -= quantidade
		
		
