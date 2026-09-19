extends Node2D
var grid_pos:Vector2i = Vector2i(1,1)
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Right") and grid_pos.x != 10:
		position.x += 16
		grid_pos.x += 1
	if Input.is_action_just_pressed("Left") and grid_pos.x != 1:
		position.x -= 16
		grid_pos.x -= 1
	if Input.is_action_just_pressed("Down") and grid_pos.y != 8:
		position.y += 16
		grid_pos.y += 1
	if Input.is_action_just_pressed("Up") and grid_pos.y != 1:
		position.y -= 16
		grid_pos.y -= 1
	if Input.is_action_just_pressed("A"):
		select_tile()


func select_tile() -> void:
	print("Grid_pos atual: ", grid_pos, position)
