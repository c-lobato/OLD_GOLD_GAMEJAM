# agent_button.gd (Anexado aos botões de piratas na UI)
extends Button

var agente_anexado: AgenteData = null

#essa função armazena os dados de um agente no botão respectivo na tela principal de organização de party
#o agente específico (qual tripulante) tem que ser especificado dentro de organization_menu.gd
func setup(agent_data: AgenteData) -> void:
	agente_anexado = agent_data
	if agente_anexado.tipo == "Bucaneiro":
		icon = load("res://Assets/sprites/characters/buccaneer_selection.png")
	elif agente_anexado.tipo == "Curandeiro":
		icon = load("res://Assets/sprites/characters/healer_selection.png")
	elif agente_anexado.tipo == "Marujo":
		icon = load("res://Assets/sprites/characters/sailor_selection.png")
	else:
		disabled
		visible = false
