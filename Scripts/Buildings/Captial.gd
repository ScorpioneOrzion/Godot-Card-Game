extends BaseBuilding

func on_destroy():
	if (STATE[KEYS.CURRENTCONTROLLER] == -1):
		return
	Global.players[STATE[KEYS.CURRENTCONTROLLER]].defeat()

func _ready():
	STATE[KEYS.MAXHEALTH] = 100
	STATE[KEYS.CURRENTHEALTH] = 100
	STATE[KEYS.VARIABLES] = [FLAGS.CAPITAL]