extends GameResource

class_name BaseBuilding

var name = "Base Building"
var description = "This is a base building"
var health = 0

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

var variables: Dictionary = {}

func _ready():
	Global.buildingDataBase[name] = self