extends Button

@onready var play = get_node("../../")

func _on_player_hit_pressed() -> void:
	var dealt_card = play.draw_card()

	play.add_to_player_total(dealt_card)
	play.display_player_cards(dealt_card)
	if play.player_total > 21:
		play.player_bust()
