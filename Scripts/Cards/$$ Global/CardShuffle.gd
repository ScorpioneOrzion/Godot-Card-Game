extends GlobalBaseCard

func get_game_name():
	return "Shuffle"

func get_game_description():
	return "Shuffle the global deck"

func on_resolve():
	Global.global_deck.append(Global.card_database[0])
	Global.shuffle_deck()
	for player in Global.players:
		var capital = player.PLAYER_BUILDINGS.find(has_flag(FLAGS.CAPITAL))
		capital.STATE[KEYS.CURRENTHEALTH] -= 1
