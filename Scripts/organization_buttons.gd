# agent_button.gd (Anexado aos botões de piratas na UI)
extends Button

var agente_anexado: AgenteData = null

#essa função armazena os dados de um agente no botão respectivo na tela principal de organização de party
#o agente específico (qual tripulante) tem que ser especificado dentro de organization_menu.gd
func setup(agent_data: AgenteData) -> void:
    agente_anexado = agent_data
    # icon = agente_anexado.textura_perfil #para caso tenhamos icons dos personagens