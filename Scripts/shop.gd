extends Control

@export var itens_a_vender:Dictionary = {} # (String,int)
@export var contratos_disponiveis: Array[AgenteData] = []

@onready var label_node = $OuroLabel
@onready var container_contratos = $ContainerContratos
@onready var container_itens = $ContainerItens
@onready var label_contrato = $ContainerContratos/ContainerLabelContratos

func _ready() -> void:
	container_contratos.grab_focus()
	atualizar_botoes_contratos()

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

func contratar_tripulante(agente: AgenteData) -> void:
	if Global.ouro >= agente.custo_contrato:
		Global.perder_ouro(agente.custo_contrato)
		Global.adicionar_contrato(agente)
		print("Tripulante ", agente.nome, " contratado por ", agente.custo_contrato, " moedas de ouro!")
	else:
		var ouro_faltante = agente.custo_contrato - Global.ouro
		print("Faltam ", ouro_faltante, " moedas de ouro para contratar ", agente.nome, "!")

#funcao nao ta atualizando os icons dos botoes, investigar como fazer
func atualizar_botoes_contratos() -> void:
	var botoes_contratos = container_contratos.get_children()
	
	#loop para lógica de botoes/recebimento de dados do AgenteData
	for i in range(contratos_disponiveis.size()):
		if i < botoes_contratos.size():
			var btn = botoes_contratos[i]
			var agente = contratos_disponiveis[i]

			btn.pressed.connect(contratar_tripulante.bind(agente))


	
