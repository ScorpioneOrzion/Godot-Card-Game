extends GameElement

class_name UiBuilding

@export var card: BuildingResource

var onBuildFunc: Callable
var onDestroyFunc: Callable
var onUpgradeFunc: Callable
var onTargetFunc: Callable
var onTurnFunc: Callable
var onHealthChangeFunc: Callable

func _ready() -> void:
	onBuildFunc = card.onBuildFunc
	onDestroyFunc = card.onDestroyFunc
	onUpgradeFunc = card.onUpgradeFunc
	onTargetFunc = card.onTargetFunc
	onTurnFunc = card.onTurnFunc
	onHealthChangeFunc = card.onHealthChangeFunc