extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/VBoxContainer/HBoxContainer/Bucaneiro.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bucaneiro_pressed() -> void:
	Global.player_captain = "Bucaneiro"
	get_tree().change_scene_to_file("res://Scenes/OrganizationMenu.tscn")


func _on_marujo_pressed() -> void:
	Global.player_captain = "Marujo"
	get_tree().change_scene_to_file("res://Scenes/OrganizationMenu.tscn")

func _on_curandeiro_pressed() -> void:
	Global.player_captain = "Curandeiro"
	get_tree().change_scene_to_file("res://Scenes/OrganizationMenu.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Credits.tscn")
