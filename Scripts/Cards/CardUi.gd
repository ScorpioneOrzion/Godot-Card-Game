extends GameElement

class_name UiCard

@export var card: CardResource

var onCastFunc: Callable
var onResolveFunc: Callable
var onDiscardFunc: Callable
var onDrawFunc: Callable
var onTurnFunc: Callable

func _ready() -> void:
	onCastFunc = card.onCastFunc
	onResolveFunc = card.onResolveFunc
	onDiscardFunc = card.onDiscardFunc
	onDrawFunc = card.onDrawFunc
	onTurnFunc = card.onTurnFunc