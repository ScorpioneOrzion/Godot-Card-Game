extends GameResource
class_name BaseCard

var owner: String:
	get:
		return "global" if DATA[GlobalEnums.Keys.OWNER] == -1 else "player_%d" % DATA[GlobalEnums.Keys.OWNER]
	set(value):
		if value == "global":
			DATA[GlobalEnums.Keys.OWNER] = -1
		elif value.begins_with("player_"):
			DATA[GlobalEnums.Keys.OWNER] = int(value.right(-7))
var current_zone: GlobalEnums.Zones:
	get:
		return DATA[GlobalEnums.Keys.ZONE]
	set(value):
		DATA[GlobalEnums.Keys.ZONE] = value
var attributes: Array[GlobalEnums.Attributes]:
	get:
		return DATA[GlobalEnums.Keys.ATTRIBUTES]
	set(value):
		DATA[GlobalEnums.Keys.ATTRIBUTES] = value
var variables: Array[int]:
	get:
		return DATA[GlobalEnums.Keys.VARIABLES]
	set(value):
		DATA[GlobalEnums.Keys.VARIABLES] = value

var DATA = {
	GlobalEnums.Keys.ATTRIBUTES: [],
	GlobalEnums.Keys.VARIABLES: [],
	GlobalEnums.Keys.OWNER: - 1,
	GlobalEnums.Keys.ZONE: GlobalEnums.Zones.DECK,
	GlobalEnums.Keys.TARGETCOUNT: 0,
	GlobalEnums.Keys.TARGETTYPE: GlobalEnums.TargetType.SELF,
	GlobalEnums.Keys.TARGETGROUP: GlobalEnums.TargetGroup.PLAYER,
	GlobalEnums.Keys.DELAY: 0,
	GlobalEnums.Keys.COST: 0,
	GlobalEnums.Keys.TIME: 0,
	GlobalEnums.Keys.RESOLVE: false,
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