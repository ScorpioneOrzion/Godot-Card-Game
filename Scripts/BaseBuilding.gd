extends GameResource
class_name BaseBuilding

var owner: String:
	get:
		return "global" if DATA[GlobalEnums.Keys.OWNER] == -1 else "player_%d" % DATA[GlobalEnums.Keys.OWNER]
	set(value):
		if value == "global":
			DATA[GlobalEnums.Keys.OWNER] = -1
		elif value.begins_with("player_"):
			DATA[GlobalEnums.Keys.OWNER] = int(value.right(-7))
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
	GlobalEnums.Keys.HEALTH: 0,
	GlobalEnums.Keys.MAXHEALTH: 0,
}

func get_game_name():
	return "Base Building"

func get_game_description():
	return "This is a base building"

func on_build():
	pass

func on_destroy():
	pass

func on_upgrade():
	pass

func on_target():
	pass

func on_turn():
	pass

func on_health_change():
	pass

func _ready():
	Global.building_database.append(self)