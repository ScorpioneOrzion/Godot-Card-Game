extends BaseCard

func get_game_name():
	return "Increase Card"
func get_game_description():
	return "Change the value of a card by %d" % STATE[KEYS.VARIABLES][0]

func _ready():
	STATE[KEYS.VARIABLES] = [0]

func on_resolve():
	if STATE[KEYS.CURRENTTARGETS].size() == 0:
		return
	var card = STATE[KEYS.VARIABLES][0]
	card[STATE[KEYS.VARIABLES]][0] += STATE[KEYS.VARIABLES][0]
	return