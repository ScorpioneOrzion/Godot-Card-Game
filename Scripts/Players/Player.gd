extends Node
class_name Player

var manager: PlayerManager
var D: Array[UiCard] = []
var H: Array[UiCard] = []
var G: Array[UiCard] = []
var B: Array[UiBuilding] = []

var health: int = 0

# start
func beginTurn():
	for card in D:
		card.onTurnFunc.call(card, manager.players, manager.players.find(self), [])
	for card in H:
		card.onTurnFunc.call(card, manager.players, manager.players.find(self), [])
	for card in G:
		card.onTurnFunc.call(card, manager.players, manager.players.find(self), [])
	for building in B:
		building.card.onTurnFunc.call(building, manager.players, manager.players.find(self), [])