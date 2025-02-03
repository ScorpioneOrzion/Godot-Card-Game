extends GameResource
class_name BaseBuilding

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