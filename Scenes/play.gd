extends Node2D
var deck_to_play = null
var is_player_ready = false
var total = 0

@onready var cardsDisplayedLabel = $cardsDisplayed
@onready var cardsTotalLabel = $cardsTotal

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
	add_to_total(dealt_cards)

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
func prepare_deck():
	deck_to_play = create_deck(8)
	deck_to_play.shuffle()
func create_deck(number_of_decks):
	const numbers = ["a","1","2","3","4","5","6","7","8","9","10","j","q","k"]
	const suits = ["s","c","d","h"]
	
	var deck_to_play = []
	var deck_of_cards = []

	for suit in suits:
		for number in numbers:
			deck_of_cards.append([suit, number])

	for x in number_of_decks:
		deck_to_play += deck_of_cards

	return deck_to_play

# _on_deal_button_pressed functions
func display_cards(card):
	if cardsDisplayedLabel.text == "":
		cardsDisplayedLabel.text += card[1]
	else:
		cardsDisplayedLabel.text += ", " + card[1]

func add_to_total(card):
	var total = 0
	
	cardsTotalLabel.text = total

# _on_stop_button_pressed functions
func reset_count():
	total = 0
