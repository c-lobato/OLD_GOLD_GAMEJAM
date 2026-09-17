extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/VBoxContainer/HBoxContainer/Bucaneiro.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bucaneiro_pressed() -> void:
	Global.player_captain = "Bucaneiro"
	var capitao = AgenteData.new()
	
	capitao.grid_pos = Vector2i(1,1)
	capitao.tipo = "Bucaneiro"
	capitao.nome = "Capitão"
	capitao.hp_max = 10
	capitao.hp_atual = 10
	capitao.speed = 1
	capitao.damage = 3
	capitao.cena_agente = load("res://Scenes/Agentes/Agent.tscn")
	Global.adicionar_contrato(capitao)
	get_tree().change_scene_to_file("res://Scenes/OrganizationMenu.tscn")


func _on_marujo_pressed() -> void:
	Global.player_captain = "Marujo"
	var capitao = AgenteData.new()
	
	capitao.grid_pos = Vector2i(1,1)
	capitao.tipo = "Marujo"
	capitao.nome = "Capitão"
	capitao.hp_max = 10
	capitao.hp_atual = 10
	capitao.speed = 1
	capitao.damage = 3
	capitao.cena_agente = load("res://Scenes/Agentes/Agent.tscn")
	Global.adicionar_contrato(capitao)
	get_tree().change_scene_to_file("res://Scenes/OrganizationMenu.tscn")

func _on_curandeiro_pressed() -> void:
	Global.player_captain = "Curandeiro"
	
	var capitao = AgenteData.new()
	var tripulante = AgenteData.new()
	capitao.grid_pos = Vector2i(1,1)
	capitao.tipo = "Curandeiro"
	capitao.nome = "Capitão"
	capitao.hp_max = 10
	capitao.hp_atual = 10
	capitao.speed = 1
	capitao.damage = 3
	capitao.cena_agente = load("res://Scenes/Agentes/Agent.tscn")
	Global.adicionar_contrato(capitao)
	tripulante.grid_pos = Vector2i(1,1)
	tripulante.tipo = "Bucaneiro"
	tripulante.nome = "Tripulante Teste"
	tripulante.hp_max = 10
	tripulante.hp_atual = 10
	tripulante.speed = 1
	tripulante.damage = 3
	tripulante.cena_agente = load("res://Scenes/Agentes/Agent.tscn")
	Global.adicionar_contrato(tripulante)
	for i in Global.contratos:
		print(i.nome)
		if i.tipo == "Curandeiro":
			print("Curandeiro")
		elif i.tipo == "Bucaneiro":
			print("Bucaneiro")
	get_tree().change_scene_to_file("res://Scenes/OrganizationMenu.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Credits.tscn")
