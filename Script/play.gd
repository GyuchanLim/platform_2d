extends Node2D

var dealer_total: int
var player_total: int
var is_player_ready: bool = false

func _ready() -> void:
	get_node("playerControl").hide()
	get_node("retryButton").hide()
	get_node("dealerControl").hide()

func draw_card() -> Array:
	return autoLoad.deck_to_play.pop_back()

# _on_play_button_pressed functions
func player_ready() -> void:
	var player_control = get_node("playerControl")
	if player_control:
		player_control.show()
	get_node("playerControl/hitButton").hide()
	get_node("playButton").hide()

# _on_deal_button_pressed functions
func display_player_cards(card) -> void:
	if $playerControl/cardsDisplayed.text == "":
		$playerControl/cardsDisplayed.text += card[1]
	else:
		$playerControl/cardsDisplayed.text += ", " + card[1]
func add_to_player_total(card) -> void:
	var card_value = card[1]
	
	player_total += autoLoad.dict_card_numbers[card[1]]
	$playerControl/cardTotal.text = "Total " + str(player_total)

func display_dealer_cards(card) -> void:
	if $dealerControl/cardsDisplayed.text == "":
		$dealerControl/cardsDisplayed.text += card[1]
	else:
		$dealerControl/cardsDisplayed.text += ", " + card[1]
func add_to_dealer_total(card) -> void:
	var card_value = card[1]
	
	dealer_total += autoLoad.dict_card_numbers[card[1]]
	$dealerControl/cardTotal.text = "Total " + str(dealer_total)

# _on_stay_button_pressed functions
func reset_total() -> void:
	player_total = 0
	dealer_total = 0
	$playerControl/cardTotal.text = ""
	$playerControl/cardsDisplayed.text = ""
	$dealerControl/cardTotal.text = ""
	$dealerControl/cardsDisplayed.text = ""
	$result.text = ""

# When player busts
func player_bust() -> void:
	$result.text = "you busted"
	disable_player_buttons()
	get_node("retryButton").show()
	
func dealer_bust() -> void:
	$result.text = "dealer busted"
	disable_dealer_buttons()
	get_node("retryButton").show()

func reset_game() -> void:
	reset_total()
	get_node("playerControl/hitButton").disabled = false
	get_node("playerControl/stayButton").disabled = false
	get_node("dealerControl/dealButton").disabled = false
	get_node("playerControl/dealButton").show()
	get_node("playerControl/hitButton").hide()
	get_node("retryButton").hide()
	get_node("dealerControl").hide()

func disable_player_buttons() -> void:
	get_node("playerControl/hitButton").disabled = true
	get_node("playerControl/stayButton").disabled = true

func disable_dealer_buttons() -> void:
	get_node("dealerControl/dealButton").disabled = true
	get_node("retryButton").show()
