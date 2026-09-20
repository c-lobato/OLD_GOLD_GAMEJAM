extends Node2D
var grid_pos:Vector2i = Vector2i(1,1)
func _ready() -> void:
	$AnimatedSprite2D.play()

@export var coord_manager: Node
@export var battle_ui: Control

var is_active: bool = true
var is_moving_agent: bool = false
var agente_selecionado: Agent = null

func _process(delta: float) -> void:
	if not is_active:
		return
		
	if Input.is_action_just_pressed("Right") and grid_pos.x != 10:
		position.x += 16
		grid_pos.x += 1
	elif Input.is_action_just_pressed("Left") and grid_pos.x != 1:
		position.x -= 16
		grid_pos.x -= 1
	elif Input.is_action_just_pressed("Down") and grid_pos.y != 8:
		position.y += 16
		grid_pos.y += 1
	elif Input.is_action_just_pressed("Up") and grid_pos.y != 1:
		position.y -= 16
		grid_pos.y -= 1
		
	if Input.is_action_just_pressed("A"):
		select_tile()

func select_tile() -> void:
	var agente = coord_manager.obter_agente_na_posicao(grid_pos)
	
	if agente != null:
		print("Agente encontrado: ", agente.name)
		is_active = false 
		battle_ui.abrir_menu(agente)
	else:
		print("Nenhum agente no quadrado selecionado.")
