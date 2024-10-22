extends Button

@onready var play = get_node("../")

func _on_retry_button_pressed() -> void:
	play.reset_game()
	
