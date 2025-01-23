extends Node
class_name CardManager

@export var AllBase: Array[CardResource] = []
@export var EffectManager: EffectManager

func get_by_name(card_name: String) -> CardResource:
	for card in AllBase:
		if card.name == card_name:
			return card
	return null # Return null if no match is found

func _ready():
	AllBase.all(EffectManager.generate_func)
