extends Button

@onready var play = get_node("../../")

func _on_dealer_pressed() -> void:
	if Score.dealer_total == 0:
		deal_once()
	deal_once()

	if Score.dealer_total > 21:
		play.dealer_bust()

func deal_once() -> void:
	var dealt_card = play.draw_card()

	Score.add_to_dealer_total(Deck.dict_card_numbers[dealt_card[1]])
	play.display_dealer_cards(Deck.dict_card_numbers[dealt_card[1]])

func _on_player_deal_button_pressed() -> void:
	for y in range(2):
		var dealt_card = play.draw_card()

		Score.add_to_player_total(Deck.dict_card_numbers[dealt_card[1]])
		play.display_player_cards(Deck.dict_card_numbers[dealt_card[1]])

	get_node("../dealButton").hide()
	get_node("../hitButton").show()
