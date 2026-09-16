extends Node2D

var grid_pos:Vector2i = Vector2i(1,1)
var is_active: bool = false #trava o cursor fora da tela principal

signal tile_selected(pos: Vector2i, pixel_pos: Vector2)
signal cancelled_placement

func _ready() -> void:
	hide() #cursor começa escondido 

func _process(delta: float) -> void:
	
	#ações de movimento dentro da grid
	if Input.is_action_just_pressed("Right") and grid_pos.x != 4:
		position.x += 16
		grid_pos.x += 1
	if Input.is_action_just_pressed("Left") and grid_pos.x != 1:
		position.x -= 16
		grid_pos.x -= 1
	if Input.is_action_just_pressed("Down") and grid_pos.y != 4:
		position.y += 16
		grid_pos.y += 1
	if Input.is_action_just_pressed("Up") and grid_pos.y != 1:
		position.y -= 16
		grid_pos.y -= 1
	
	#ações de confirmação/cancelamento
	if Input.is_action_just_pressed("A"):
		select_tile()
	if Input.is_action_just_pressed("B"):
		cancelled_placement.emit()

#função que confirma a grid_pos onde a instancia do contrato foi colocada
func select_tile() -> void:
	print("Grid_pos atual: ", grid_pos)
	tile_selected.emit(grid_pos, position)
