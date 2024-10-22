extends Button

@onready var play = get_node("../../")

func _on_dealer_pressed() -> void:
	if play.dealer_total == 0:
		deal_once()
	deal_once()

	if play.dealer_total > 21:
		play.dealer_bust()

func deal_once() -> void:
	var dealt_card = play.draw_card()

	play.add_to_dealer_total(dealt_card)
	play.display_dealer_cards(dealt_card)

func _on_player_deal_button_pressed() -> void:
	for y in range(2):
		var dealt_card = play.draw_card()

		play.add_to_player_total(dealt_card)
		play.display_player_cards(dealt_card)
	get_node("../dealButton").hide()
	get_node("../hitButton").show()
