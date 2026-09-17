extends Control

var itens_a_vender:Dictionary = {} # (String,int)
@onready var label_node = $VBoxContainer/OuroLabel

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var label_texto = "Gold: "
	label_node.text = label_texto + str(Global.ouro)

func comprar_item(agente:AgenteData, item_nome:String, item:Resource) -> void:
	var valor_item = itens_a_vender[item_nome]
	if (valor_item <= Global.ouro):
		Global.atribuir_item(agente, item)
		Global.ouro -= valor_item
		print("Item comprado: $item_nome")
	else:
		print("Dinheiro insuficiente! Falta " + str(valor_item - Global.ouro))
