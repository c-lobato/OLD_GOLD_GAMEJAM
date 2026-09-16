extends Node2D
var capitao = AgenteData.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/VBoxContainer/HBoxContainer/Bucaneiro.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bucaneiro_pressed() -> void:
	Global.player_captain = "Bucaneiro"
	capitao.tipo = "Bucaneiro"
	capitao.nome = "Capitão"
	capitao.hp_max = 10
	capitao.hp_atual = 10
	capitao.speed = 1
	capitao.damage = 3
	Global.adicionar_contrato(capitao)
	get_tree().change_scene_to_file("res://Scenes/OrganizationMenu.tscn")


func _on_marujo_pressed() -> void:
	Global.player_captain = "Marujo"
	capitao.tipo = "Marujo"
	capitao.nome = "Capitão"
	capitao.hp_max = 10
	capitao.hp_atual = 10
	capitao.speed = 1
	capitao.damage = 3
	Global.adicionar_contrato(capitao)
	get_tree().change_scene_to_file("res://Scenes/OrganizationMenu.tscn")

func _on_curandeiro_pressed() -> void:
	Global.player_captain = "Curandeiro"
	capitao.tipo = "Curandeiro"
	capitao.nome = "Capitão"
	capitao.hp_max = 10
	capitao.hp_atual = 10
	capitao.speed = 1
	capitao.damage = 3
	Global.adicionar_contrato(capitao)
	for i in Global.contratos:
		print(i.nome)
	get_tree().change_scene_to_file("res://Scenes/OrganizationMenu.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Credits.tscn")
