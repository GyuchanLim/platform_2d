extends Node

var deck_to_play: Array
var dict_card_numbers: Dictionary

func _ready():
	var root = get_tree().root

func prepare_deck() -> void:
	deck_to_play = create_deck(8)
	deck_to_play.shuffle()

func create_deck(number_of_decks) -> Array:
	const numbers = ["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"]
	const suits = ["Spade","Clubs","Diamond","Heart"]
	
	var deck_of_cards: Array

	for number_index in numbers.size():
		dict_card_numbers[numbers[number_index]] = number_index + 1 if number_index < 9 else 10
		for suit in suits:
			deck_of_cards.append([suit, numbers[number_index]])

	for x in number_of_decks:
		deck_to_play += deck_of_cards

	return deck_to_play
