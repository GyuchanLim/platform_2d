extends Node2D

func _ready() -> void:
	get_node("Play Button/Deal Button").hide()
	get_node("Play Button/Stop Button").hide()
	pass

func create_deck(number_of_decks):
	const numbers = ['a',1,2,3,4,5,6,7,8,9,10,'j','q','k']
	const suits = ['s','c','d','h']
	
	var deck_to_play = []
	var deck_of_cards = []

	for suit in suits:
		for number in numbers:
			deck_of_cards.append([suit, number])

	for x in number_of_decks:
		deck_to_play += deck_of_cards

	return deck_to_play

func player_ready() -> void:
	get_node('Play Button/Deal Button').show()
	get_node('Play Button/Stop Button').show()

func _on_play_button_pressed() -> void:
	var deck_to_play = create_deck(8)
	player_ready()
	
	# Deal cards
	# Player first, then dealer


	# Show player options
	
	pass # Replace with function body.
