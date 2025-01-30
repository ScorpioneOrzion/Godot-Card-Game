extends GameResource

class_name BaseCard

var DEFAULT_KEYS = Global.DEFAULT_KEYS
var STATE_KEYS = Global.STATE_KEYS

var DEFAULTS = {
	DEFAULT_KEYS.IGNORE: false,
	DEFAULT_KEYS.ALWAYSRESOLVE: false,
	DEFAULT_KEYS.ISCARD: true,
	DEFAULT_KEYS.TARGETCOUNT: 0,
	DEFAULT_KEYS.TARGETTYPE: TargetType.SELF,
	DEFAULT_KEYS.TARGETGROUP: TargetGroup.PLAYER,
	DEFAULT_KEYS.DELAY: 0
}

var STATE := {
	STATE_KEYS.COST: 0,
	STATE_KEYS.TIME: 0,
	STATE_KEYS.RESOLVE: false,
	STATE_KEYS.PASS: false,
	STATE_KEYS.DONE: false,
	STATE_KEYS.VARIABLES: [],
	STATE_KEYS.CURRENTCONTROLLER: -1,
	STATE_KEYS.CURRENTOWNER: -1,
	STATE_KEYS.CURRENTTARGETS: [],
}

func get_game_name():
	return "Base Card"
func get_game_description():
	return "This is a base card"

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
	newCard.STATE = STATE.duplicate(true)

	return newCard

func clear_state():
	STATE[STATE_KEYS.CURRENTCONTROLLER] = -1
	STATE[STATE_KEYS.CURRENTTARGETS] = []
	STATE[STATE_KEYS.RESOLVE] = false
	STATE[STATE_KEYS.TIME] = 0

func on_cast():
	if DEFAULTS[DEFAULT_KEYS.TARGETCOUNT] > 0 and STATE[STATE_KEYS.CURRENTTARGETS].size() != DEFAULTS[DEFAULT_KEYS.TARGETCOUNT]:
		return false
	STATE[STATE_KEYS.RESOLVE] = true
	STATE[STATE_KEYS.TIME] = DEFAULTS[DEFAULT_KEYS.DELAY]
	STATE[STATE_KEYS.CURRENTOWNER] = STATE[STATE_KEYS.CURRENTCONTROLLER]
	return true

func resolve_card():
	if STATE[STATE_KEYS.RESOLVE] or DEFAULTS[DEFAULT_KEYS.ALWAYSRESOLVE]:
		self.on_resolve()
	STATE[STATE_KEYS.DONE] = true

func on_resolve():
	pass

func on_discard():
	pass

func on_draw():
	pass

func on_begin_of_turn():
	pass

func on_end_of_turn():
	if STATE[STATE_KEYS.PASS]:
		STATE[STATE_KEYS.PASS] = false
		return
	
	if STATE[STATE_KEYS.CURRENTTARGETS].empty() or DEFAULTS[DEFAULT_KEYS.IGNORE] == true:
		STATE[STATE_KEYS.TIME] -= 1
		
		if STATE[STATE_KEYS.TIME] <= 0:
			resolve_card()
			clear_state()

func _ready():
	Global.cardDataBase[self.get_game_name()] = self