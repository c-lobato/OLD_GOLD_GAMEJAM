extends Node2D

@export var grid_pos:Vector2i = Vector2i(1,1)
@export var in_contact = false
@export var tipo = ""

func _ready() -> void:
	if tipo == "Blue":
		$AnimatedSprite2D.animation = "Blue"
		$AnimatedSprite2D.frame = 0
	if tipo == "White":
		$AnimatedSprite2D.animation = "White"
		$AnimatedSprite2D.frame = 0


func _process(delta: float) -> void:
	pass
