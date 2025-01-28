extends Node
class_name Global

@export var cardManager: CardManager
var players: Array[Player] = []
var currentPlayer: int = 0
var globalDeck: Array[UiCard] = []
var globalDiscard: Array[UiCard] = []

func draw():
	if globalDeck.size() == 0:
		cardManager.get_by_name("")
		shuffle()
	
	var card = globalDeck.pop_front()
	globalDiscard.push_back(card)
	card.onDrawFunc.call(card, players, currentPlayer, [])

func shuffle():
	for card in globalDiscard:
		globalDeck.push_back(card)
	globalDiscard.clear()
	globalDeck.shuffle()