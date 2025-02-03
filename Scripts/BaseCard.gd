extends GameResource
class_name BaseCard

var owner:
	get:
		return "global" if DATA[GlobalEnums.Keys.OWNER] == -1 else "player_%d" % DATA[GlobalEnums.Keys.OWNER]
var current_zone:
	get:
		return DATA[GlobalEnums.Keys.ZONE]
var attributes:
	get:
		return DATA[GlobalEnums.Keys.ATTRIBUTES]
var variables:
	get:
		return DATA[GlobalEnums.Keys.VARIABLES]
var flags:
	get:
		return DATA[GlobalEnums.Keys.FLAGS]

var DATA = {
	GlobalEnums.Keys.ATTRIBUTES: [],
	GlobalEnums.Keys.VARIABLES: [],
	GlobalEnums.Keys.OWNER: - 1,
	GlobalEnums.Keys.FLAGS: [],
	GlobalEnums.Keys.ZONE: GlobalEnums.Zones.DECK,
	GlobalEnums.Keys.TARGETCOUNT: 0,
	GlobalEnums.Keys.TARGETTYPE: GlobalEnums.TargetType.SELF,
	GlobalEnums.Keys.TARGETGROUP: GlobalEnums.TargetGroup.PLAYER,
	GlobalEnums.Keys.DELAY: [],
	GlobalEnums.Keys.COST: [],
	GlobalEnums.Keys.TIME: [],
	GlobalEnums.Keys.RESOLVE: [],
	GlobalEnums.Keys.CURRENTTARGETS: [],
}

func get_game_name():
	return "Base Card"

func get_game_description():
	return "This is a base card"

func on_cast():
	pass

func on_resolve():
	pass

func on_discard():
	pass

func on_draw():
	pass

func on_begin_of_turn():
	pass

func on_end_of_turn():
	pass

func _ready():
	Global.card_database.append(self)