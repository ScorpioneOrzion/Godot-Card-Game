extends BaseCard

func get_game_name():
	return "Increase Card"
func get_game_description():
	return "Change a value of a card by %d" % variables

func _ready():
	variables = [0]
	DATA[GlobalEnums.Keys.TARGETCOUNT] = 1
	DATA[GlobalEnums.Keys.TARGETGROUP] = GlobalEnums.TargetGroup.CARD

func on_resolve():
	if DATA[GlobalEnums.Keys.CURRENTTARGETS].size() == 0:
		return
	var card = DATA[GlobalEnums.Keys.CURRENTTARGETS][0]
	card.variables[0] += variables[0]
	return