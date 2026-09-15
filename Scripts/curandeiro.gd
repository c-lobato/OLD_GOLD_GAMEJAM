extends Button

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	Global.player_captain = "Curandeiro"
	get_tree().change_scene_to_file("res://Scenes/OrganizationMenu.tscn")
