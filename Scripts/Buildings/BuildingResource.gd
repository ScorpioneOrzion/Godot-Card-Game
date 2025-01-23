extends GameResource

class_name BuildingResource

@export var health: int = 0
@export_category("Action")
@export_multiline var onBuild: String = ""
@export_multiline var onDestroy: String = ""
@export_multiline var onUpgrade: String = ""
@export_multiline var onTarget: String = ""
@export_multiline var onTurn: String = ""
@export_multiline var onHealthChange: String = ""

var onBuildFunc: Callable
var onDestroyFunc: Callable
var onUpgradeFunc: Callable
var onTargetFunc: Callable
var onTurnFunc: Callable
var onHealthChangeFunc: Callable