extends Node

var players: Array[Player] = []
var currentPlayer: int = 0
var globalDeck: Array[BaseCard] = []
var globalDiscard: Array[BaseCard] = []
var cardDataBase: Dictionary = {}
var buildingDataBase: Dictionary = {}

func draw():
	if globalDeck.size() == 0:
		# cardManager.get_by_name("")
		shuffle()
	
	var card = globalDeck.pop_front()
	globalDiscard.push_back(card)
	card.onDrawFunc.call(card, players, currentPlayer, [])

func shuffle():
	for card in globalDiscard:
		globalDeck.push_back(card)
	globalDiscard.clear()
	globalDeck.shuffle()

func _ready():
	var test = test_child.new()
	test.run()