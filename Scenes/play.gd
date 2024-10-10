extends Node2D

var deck_to_play: Array = []
var is_player_ready: bool = false
var total: int = 0
var dict_card_numbers: Dictionary = {}

@onready var cardsDisplayedLabel = $cardsDisplayed
@onready var cardsTotalLabel = $cardTotal

func _ready() -> void:
	get_node("dealButton").hide()
	get_node("stopButton").hide()
	get_node("cardsDisplayed").hide()

# BUTTON PRESSES
func _on_play_button_pressed() -> void:
	if !is_player_ready:
		player_ready()
		prepare_deck()
	else:
		print("Player is already ready!")

func _on_deal_button_pressed() -> void:
	var dealt_card = deck_to_play.pop_back()
	
	display_cards(dealt_card)
	add_to_total(dealt_card)

func _on_stop_button_pressed() -> void:
	reset_total()
	print("Stop button pressed")


# _on_play_button_pressed functions
func player_ready() -> void:
	is_player_ready = true
	get_node("dealButton").show()
	get_node("stopButton").show()
	get_node("playButton").hide()
	get_node("cardsDisplayed").show()
func prepare_deck() -> void:
	deck_to_play = create_deck(8)
	deck_to_play.shuffle()
func create_deck(number_of_decks) -> Array:
	const numbers = ["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"]
	const suits = ["Spade","Clubs","Diamond","Heart"]
	
	var deck_of_cards: Array = []

	for number_index in numbers.size():
		dict_card_numbers[numbers[number_index]] = number_index + 1 if number_index < 9 else 10
		for suit in suits:
			deck_of_cards.append([suit, numbers[number_index]])

	for x in number_of_decks:
		deck_to_play += deck_of_cards

	return deck_to_play

# _on_deal_button_pressed functions
func display_cards(card) -> void:
	if cardsDisplayedLabel.text == "":
		cardsDisplayedLabel.text += card[1]
	else:
		cardsDisplayedLabel.text += ", " + card[1]

func add_to_total(card) -> void:
	var card_value = card[1]
	
	total += dict_card_numbers[card[1]]
	cardsTotalLabel.text = str(total)

# _on_stop_button_pressed functions
func reset_total() -> void:
	total = 0
	cardsTotalLabel.text = ""
	cardsDisplayedLabel.text = ""

func _on_close_button_pressed() -> void:
	get_tree().quit()
