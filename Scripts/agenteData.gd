class_name AgenteData
extends Resource

@export var nome: String = ""
@export var hp_max: int = 10
@export var hp_atual: int = 10
@export var speed: int = 1
@export var damage: int = 3
@export var tipo: String = ""

@export var cena_agente: PackedScene

@export var itens_equipados: Array[Resource] = []
