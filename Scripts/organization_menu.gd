extends Node2D

@onready var party_grid = $PartyGrid
@onready var org_cursor = $Cursor
@onready var agents_container = $"UI Layer/Control/AgentsContainer"
@onready var btn_battle = $"UI Layer/Control/Battle"

var occupied_tiles = {} # salva a disposição da party: chave = Vector2i, valor = AgenteData
var selected_agent: AgenteData = null

# Called when the node enters the scene tree for the first time.
func _ready(): 
	print("Piratas na Global: ", Global.contratos.size()) #para verificar quantos agents foram instanciados na lista

	#inicializa a cena direto no botão de GO BATTLE
	btn_battle.grab_focus()

	party_grid.modulate.a = 0.3    #diminui canal alpha da grid ao carregar a cena

	org_cursor.tile_selected.connect(_on_cursor_tile_selected)
	org_cursor.cancelled_placement.connect(_on_cursor_cancelled)

	atualizar_agentes()

#MAQUINA DE ESTADOS - MODO "LOJA" VS MODO "CONSTRUÇÃO"
#função chamada ao selecionar um agente (apertar Enter numa tropa para posiciona-la na grid)
func _on_agent_pressed(btn_node: Button) -> void:
	if btn_node.agente_anexado == null:
		print("O botão não tem um pirata anexado")
		return

	selected_agent = btn_node.agente_anexado
	org_cursor.is_active = true
	org_cursor.show()

	party_grid.modulate.a = 0.8
	
	#tira o foco da UI e joga para a grid da party
	var focus_owner = get_viewport().gui_get_focus_owner()
	if focus_owner:
		focus_owner.release_focus()

#função chamada no modo construção ao selecionar um tile e posicionar uma tropa
func _on_cursor_tile_selected(grid_pos: Vector2i, pixel_pos: Vector2) -> void:
	if selected_agent == null:
		print("Crash evitado: O cursor tentou posicionar, mas não há pirata selecionado.")
		_return_to_organization_screen()
		return

	
	#if para verificação de ocupação do tile
	if occupied_tiles.has(grid_pos):
		print("Slot ocupado!! Selecione outro")     
		return

	#caso o tile n esteja ocupado, é adicionado à lista de posição o agente selecionado
	occupied_tiles[grid_pos] = selected_agent
	if selected_agent.cena_agente:   #verificar qual classe vai receber a PackedScene dos tripulante
		var novo_tripulante = selected_agent.cena_agente.instantiate()
		novo_tripulante.carregar_dados(selected_agent)
		novo_tripulante.position = pixel_pos
		selected_agent.grid_pos = grid_pos
		party_grid.add_child(novo_tripulante)
		print("Tripulante posicionado na grid! Posição: ", grid_pos)
		Global.adicionar_contrato_grid(selected_agent)
		atualizar_agentes()

	_return_to_organization_screen()

func atualizar_agentes() ->void:
	var agents_buttons = agents_container.get_children()
	for i in range(Global.contratos.size()):
		if i < agents_buttons.size():
			var btn = agents_buttons[i]
			var agente = Global.contratos[i]
		
			btn.setup(agente)
			btn.pressed.connect(_on_agent_pressed.bind(btn))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_battle_pressed() -> void:
	if Global.level_atual == 1:
		get_tree().change_scene_to_file("res://Scenes/Battles/Battle1.tscn")
	if Global.level_atual == 2:
		get_tree().change_scene_to_file("res://Scenes/Battles/Battle2.tscn")
	if Global.level_atual == 3:
		get_tree().change_scene_to_file("res://Scenes/Battles/Battle3.tscn")
	if Global.level_atual == 4:
		get_tree().change_scene_to_file("res://Scenes/Battles/Battle4.tscn")
	if Global.level_atual == 5:
		get_tree().change_scene_to_file("res://Scenes/Battles/Battle5.tscn")

func _on_cursor_cancelled() -> void:
	_return_to_organization_screen()

func _return_to_organization_screen() -> void:
	org_cursor.is_active = false
	org_cursor.hide()
	selected_agent = null

	party_grid.modulate.a = 0.3

	# Devolve o foco para o primeiro botão para o jogador continuar navegando
	agents_container.get_child(0).grab_focus()

	
