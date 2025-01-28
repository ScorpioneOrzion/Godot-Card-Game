extends Node
class_name Player

var manager: PlayerManager
var D: Array[UiCard] = []
var H: Array[UiCard] = []
var G: Array[UiCard] = []
var B: Array[UiBuilding] = []
var ownIndex: int

func beginTurn():
	for card in D:
		card.onTurnFunc.call(card, manager.players, ownIndex, [])
	for card in H:
		card.onTurnFunc.call(card, manager.players, ownIndex, [])
	for card in G:
		card.onTurnFunc.call(card, manager.players, ownIndex, [])
	for building in B:
		building.onTurnFunc.call(building, manager.players, ownIndex, [])
	draw()

func lose():
	manager.players.remove_at(ownIndex)
	queue_free()

func draw():
	if D.size() > 0:
		var card = D.pop_front()
		H.push_back(card)
		card.onDrawFunc.call(card, manager.players, ownIndex, [])
	else:
		lose()