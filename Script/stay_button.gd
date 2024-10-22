extends Button

@onready var play = get_node("../../")

func _on_stay_button_pressed() -> void:
	get_node("../../dealerControl").show()
	play.disable_player_buttons()
	print("Stop button pressed")
