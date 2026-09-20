extends Control

signal acao_selecionada(tipo_acao: String, agente: Node)

@onready var btn_move: TextureButton = $NinePatchRect/TextureButton3
@onready var btn_attack: TextureButton = $NinePatchRect/TextureButton
@onready var btn_item: TextureButton = $NinePatchRect/TextureButton2
@onready var agent_display: TextureRect = $UIAgentDisplay

var agente_atual: Node = null

func _ready() -> void:
	set_process_input(false)
	
	btn_move.pressed.connect(func(): _executar_acao("move"))
	btn_attack.pressed.connect(func(): _executar_acao("attack"))
	btn_item.pressed.connect(func(): _executar_acao("item"))

func abrir_menu(agente: Node) -> void:
	agente_atual = agente
	show()
	set_process_input(true)
	
	if agente.dados.tipo == "Bucaneiro":
		agent_display.texture = load("res://Assets/sprites/misc/Bucaneer_menu.png")
	if agente.dados.tipo == "Curandeiro":
		agent_display.texture = load("res://Assets/sprites/misc/Healer_menu.png")
	if agente.dados.tipo == "Marujo":
		agent_display.texture = load("res://Assets/sprites/misc/Sailor_menu.png")	

	btn_move.grab_focus()

func fechar_menu() -> void:
	agente_atual = null
	set_process_input(false)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("B"):
		get_viewport().set_input_as_handled()
		fechar_menu()

func _executar_acao(tipo: String) -> void:
	acao_selecionada.emit(tipo, agente_atual)
