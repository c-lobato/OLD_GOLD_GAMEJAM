extends Node2D

# (String,int)
var itens_a_vender:Dictionary = {}

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func comprar_item(agente:AgenteData, item_nome:String, item:Resource) -> void:
	var valor_item = itens_a_vender[item_nome]
	if (valor_item <= Global.dinheiro):
		Global.atribuir_item(agente, item)
		Global.dinheiro -= valor_item
		print("Item comprado: {item_nome}")
	else:
		print("Dinheiro insuficiente! Falta {valor_item - Global.dinheiro}")
