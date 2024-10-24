extends Button

@onready var play = get_node("../../")

func _on_player_hit_pressed() -> void:
	var dealt_card = play.draw_card()

	Score.add_to_player_total(Deck.dict_card_numbers[dealt_card[1]])
	play.display_player_cards(Deck.dict_card_numbers[dealt_card[1]])
	if Score.player_total > 21:
		play.player_bust()
