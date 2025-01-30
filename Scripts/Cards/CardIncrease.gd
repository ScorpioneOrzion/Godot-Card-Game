extends BaseCard

func get_game_name():
	return "Increase Card"
func get_game_description():
	return "Change the value of a card by %d" % STATE[STATE_KEYS.VARIABLES][0]

func _ready():
	STATE[STATE_KEYS.VARIABLES] = [0]

func on_resolve():
	if STATE[STATE_KEYS.CURRENTTARGETS].size() == 0:
		return
	var card = STATE[STATE_KEYS.VARIABLES][0]
	card[STATE[STATE_KEYS.VARIABLES]][0] += STATE[STATE_KEYS.VARIABLES][0]
	return