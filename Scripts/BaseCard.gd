extends GameResource

class_name BaseCard

const NAME = "Base Card"
func get_description():
	return "This is a base card"
const IGNORE = false
const ALWAYSRESOLVE = false
const ISCARD = true # false for effects
const TARGETCOUNT = 0 # 0 for all targets (does not target self, nor target at all)
const TARGETTYPE = TargetType.SELF
const TARGETGROUP = TargetGroup.PLAYER

var cost = 0
var time = 0
var delay = 0
var resolve = false
var variables: Dictionary = {}
var currentController = -1
var currentOwner = -1
var currentTargets = []
var selfTargets = []

enum TargetType {
	SELF,
	ENEMY,
	ANY
}

enum TargetGroup {
	PLAYER,
	CARD,
	BUILDING
}

func clone():
	var newCard: BaseCard = self.duplicate()
	newCard.currentController = -1
	newCard.currentOwner = -1
	newCard.currentTargets = []
	newCard.cost = cost
	newCard.time = time
	newCard.delay = delay
	newCard.resolve = resolve
	newCard.variables = variables.duplicate()

	return newCard

func reset():
	currentTargets = []
	resolve = false
	time = 0
	currentController = -1

func on_cast():
	if TARGETCOUNT > 0 and currentTargets.size() != TARGETCOUNT:
		return false
	resolve = true
	time = delay
	currentController = currentOwner
	return true

func resolve_card():
	if resolve or ALWAYSRESOLVE:
		self.on_resolve()
		self.on_discard()

func on_resolve():
	pass

func on_discard():
	if currentOwner != -1:
		var player = Global.players[currentOwner]
		player.G.append(player.H.pop_at(player.H.find(self)))
		reset()

func on_draw():
	if currentOwner != -1:
		var player = Global.players[currentOwner]
		player.H.append(player.D.pop_at(player.D.find(self)))
		reset()

func on_begin_of_turn():
	pass

var doneEndOfTurn = false
func on_end_of_turn():
	if doneEndOfTurn:
		return

	if currentTargets.empty() or IGNORE == true:
		time -= 1
		if time == 0:
			on_resolve()
	
	doneEndOfTurn = true

func _ready():
	Global.cardDataBase[NAME] = self