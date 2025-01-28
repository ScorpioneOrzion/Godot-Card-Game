extends GameResource

class_name CardResource
@export var name: String = ""
@export var delay: int = 0 # The time it takes for the card to resolve (in turns)
@export_group("Type")
@export_flags("Ignore", "Resolve") var type = 0
@export_group("Action")
@export_multiline var onCast: String = "" # Function to be called when the card is played (in the form of a string)
@export_multiline var onResolve: String = "" # Function to be called when the card resolves (in the form of a string)
@export_multiline var onDiscard: String = "" # Function to be called when the card is discarded (in the form of a string)
@export_multiline var onDraw: String = "" # Function to be called when the card is drawn (in the form of a string)
@export_multiline var onTurn: String = "" # Function to be called at the start of the player's turn (in the form of a string)

@export_group("Target")
@export_flags("Card", "Building", "Player", "Resource") var cardTargets = 0
@export_flags("Self", "Ally", "Enemy") var playerTargets = 0
@export_subgroup("Amount") # Only applies if any of the above are true
@export var minTargets: int = 0
@export var maxTargets: int = 0 # -1 for infinite

var resolve = true
var totalTimeLeft = 0

var onCastFunc: Callable
var onResolveFunc: Callable
var onDiscardFunc: Callable
var onDrawFunc: Callable
var onTurnFunc: Callable
