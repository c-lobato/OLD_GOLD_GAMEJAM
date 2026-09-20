extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Skip"):
		get_tree().change_scene_to_file("res://Scenes/Shop.tscn")
		Global.level_atual += 1
	pass
