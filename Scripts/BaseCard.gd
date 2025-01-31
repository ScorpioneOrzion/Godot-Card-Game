extends GameResource
class_name BaseCard

func has_flag(flag: FLAGS):
	return DEFAULTS[KEYS.FLAGS].contains(flag)

var DEFAULTS = {
	KEYS.IGNORE: false,
	KEYS.ALWAYSRESOLVE: false,
	KEYS.FLAGS: [],
	KEYS.ISCARD: true,
	KEYS.TARGETCOUNT: 0,
	KEYS.TARGETTYPE: TargetType.SELF,
	KEYS.TARGETGROUP: TargetGroup.PLAYER,
	KEYS.DELAY: 0
}

var STATE := {
	KEYS.COST: 0,
	KEYS.TIME: 0,
	KEYS.RESOLVE: false,
	KEYS.PASS: false,
	KEYS.DONE: false,
	KEYS.VARIABLES: [],
	KEYS.CURRENTCONTROLLER: -1,
	KEYS.CURRENTOWNER: -1,
	KEYS.CURRENTTARGETS: [],
}

func get_game_name():
	return "Base Card"
func get_game_description():
	return "This is a base card"

enum TargetType {
	SELF,
	ENEMY,
	ANY,
	NONE
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
	STATE[KEYS.CURRENTCONTROLLER] = -1
	STATE[KEYS.CURRENTTARGETS] = []
	STATE[KEYS.RESOLVE] = false
	STATE[KEYS.TIME] = 0

func on_cast():
	if DEFAULTS[KEYS.TARGETCOUNT] > 0 and STATE[KEYS.CURRENTTARGETS].size() != DEFAULTS[KEYS.TARGETCOUNT]:
		return false
	STATE[KEYS.RESOLVE] = true
	STATE[KEYS.TIME] = DEFAULTS[KEYS.DELAY]
	STATE[KEYS.CURRENTOWNER] = STATE[KEYS.CURRENTCONTROLLER]
	return true

func resolve_card():
	if STATE[KEYS.RESOLVE] or DEFAULTS[KEYS.ALWAYSRESOLVE]:
		self.on_resolve()
	STATE[KEYS.DONE] = true

func on_resolve():
	pass

func on_discard():
	pass

func on_draw():
	pass

func on_begin_of_turn():
	pass

func on_end_of_turn():
	if STATE[KEYS.PASS]:
		STATE[KEYS.PASS] = false
		return
	
	if STATE[KEYS.CURRENTTARGETS].empty() or DEFAULTS[KEYS.IGNORE] == true:
		STATE[KEYS.TIME] -= 1
		
		if STATE[KEYS.TIME] <= 0:
			resolve_card()
			clear_state()

func _ready():
	Global.card_database.append(self)