extends TextureRect

@export var selected_agent = ""

func _ready() -> void:
	selected_agent = Global.player_captain
	if selected_agent == "Bucaneiro":
		self.texture = load("res://Assets/sprites/misc/Bucaneer_menu.png")
	if selected_agent == "Curandeiro":
		self.texture = load("res://Assets/sprites/misc/Healer_menu.png")
	if selected_agent == "Marujo":
		self.texture = load("res://Assets/sprites/misc/Sailor_menu.png")	

func _process(delta: float) -> void:
	pass
