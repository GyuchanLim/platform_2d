extends Node

var dealer_total: int = 0
var player_total: int = 0

func _ready():
	var root = get_tree().root

func add_to_dealer_total(card_value) -> void:
	dealer_total += card_value

func add_to_player_total(card_value) -> void:
	player_total += card_value
