extends Button

@onready var play = get_node("../")

func _on_pressed() -> void:
	play.player_ready()
	play.prepare_deck()