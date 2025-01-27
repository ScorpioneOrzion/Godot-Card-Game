extends Node
class_name BuildingManager

@export var AllBase: Array[BuildingResource] = []
@export var Effect_Manager: EffectManager

func get_by_name(card_name: String) -> BuildingResource:
	for building in AllBase:
		if building.name == card_name:
			return building
	return null # Return null if no match is found

func _ready():
	AllBase.all(Effect_Manager.setBuildingFunc)