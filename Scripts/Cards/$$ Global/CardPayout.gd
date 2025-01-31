extends GlobalBaseCard

func get_game_name():
	return ""

func on_resolve():
	for player in Global.players:
		var capital = player.PLAYER_BUILDINGS.find(has_flag(FLAGS.CAPITAL))
		capital.STATE[KEYS.CURRENTHEALTH] -= 1
