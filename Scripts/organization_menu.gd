extends Node2D

@onready var party_grid = $PartyGrid
@onready var org_cursor = $Cursor
@onready var agents_container = $"UI Layer/Control/AgentsContainer"
@onready var btn_battle = $"UI Layer/Control/Battle"

var occupied_tiles = {} # salva a disposição da party: chave = Vector2i, valor = AgenteData
var selected_agent: AgenteData = null

# Called when the node enters the scene tree for the first time.
func _ready(): 
	#inicializa a cena direto no botão de GO BATTLE
	btn_battle.grab_focus()

	org_cursor.tile_selected.connect(_on_cursor_tile_selected)
	org_cursor.cancelled_placement.connect(_on_cursor_cancelled)

	var agents_buttons = agents_container.get_children()

	#este for serve para verificar a posição do botão e sobrepor com a posição do agente
	#no array Global.contratos, assim injetando os dados diretamente no botão com btn.setup(agente)
	for i in range(Global.contratos.size()):
		if i < agents_buttons.size():
			var btn = agents_buttons[i]
			var agente = Global.contratos[i]
		
			btn.setup(agente)
			btn.pressed.connect(_on_agent_pressed.bind(btn))

#MAQUINA DE ESTADOS - MODO "LOJA" VS MODO "CONSTRUÇÃO"
#função chamada ao selecionar um agente (apertar Enter numa tropa para posiciona-la na grid)
func _on_agent_pressed(btn_node: Button) -> void:
	if btn_node.agente_anexado == null:
		return

	selected_agent = btn_node.agente_anexado
	org_cursor.is_active = true
	org_cursor.show()

	#tira o foco da UI e joga para a grid da party
	var focus_owner = get_viewport().gui_get_focus_owner()
	if focus_owner:
		focus_owner.release_focus()

#função chamada no modo construção ao selecionar um tile e posicionar uma tropa
func _on_cursor_tile_selected(grid_pos: Vector2i, pixel_pos: Vector2) -> void:
	#if para verificação de ocupação do tile
	if occupied_tiles.has(grid_pos):
		print("Slot ocupado!! Selecione outro")     
		return

	#caso o tile n esteja ocupado, é adicionado à lista de posição o agente selecionado
	occupied_tiles[grid_pos] = selected_agent
	if selected_agent.AgentData:   #verificar qual classe vai receber a PackedScene dos tripulante
		var novo_tripulante = selected_agent.AgentData.instantiate()
		novo_tripulante.position = pixel_pos
		party_grid.add_child(novo_tripulante)
		print("Tripulante posicionado na grid! Posição: ", grid_pos)

	_return_to_organization_screen()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_battle_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Battle.tscn")

func _on_cursor_cancelled() -> void:
	_return_to_organization_screen()

func _return_to_organization_screen() -> void:
	org_cursor.is_active = false
	org_cursor.hide()
	selected_agent = null

	# Devolve o foco para o primeiro botão para o jogador continuar navegando
	agents_container.get_child(0).grab_focus()
