extends Node2D
@onready var coordManager = $CoordManager
func _ready() -> void:
	for i in Global.contratos_equipados_grid:
		spawnar_agente(i)

func _process(delta: float) -> void:
	pass
	
func spawnar_agente(dados_do_agente: AgenteData) -> void:
	if dados_do_agente.cena_agente == null:
		print("ERRO: O agente ", dados_do_agente.nome, " não tem uma cena atribuída!")
		return
		
	if not dados_do_agente.cena_agente is PackedScene or not dados_do_agente.cena_agente.can_instantiate():
		print("ERRO: A cena do agente ", dados_do_agente.nome, " está corrompida ou inválida na memória. Tentando recarregar...")

		dados_do_agente.cena_agente = load("res://Scenes/Agentes/Agent.tscn")
		
	print("Agente achado com sucesso!")
	var novo_agente = dados_do_agente.cena_agente.instantiate()
	novo_agente.grid_pos_alterada.connect(coordManager.registrar_posicao_agente)
	add_child(novo_agente)
	
	if novo_agente.has_method("carregar_dados"):
		novo_agente.carregar_dados(dados_do_agente)
		
	else:
		print("Aviso: O nó instanciado não possui a função 'carregar_dados'")
