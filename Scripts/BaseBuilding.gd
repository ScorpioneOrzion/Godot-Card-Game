extends GameResource
class_name BaseBuilding

func has_flag(flag: FLAGS):
	return DEFAULTS[KEYS.FLAGS].contains(flag)

var DEFAULTS = {
	KEYS.UPGRADE: [],
	KEYS.FLAGS: [],
}

var STATE := {
	KEYS.CURRENTCONTROLLER: -1,
	KEYS.CURRENTHEALTH: 0,
	KEYS.MAXHEALTH: 0,
	KEYS.VARIABLES: []
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