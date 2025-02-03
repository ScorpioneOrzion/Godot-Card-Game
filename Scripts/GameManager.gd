extends Resource
class_name GameManager

var card_database: Array[BaseCard] = []
var building_database: Array[BaseBuilding] = []
var all_cards: Array[BaseCard] = []

var zones: Dictionary = {}
var count_players := 0
var buildings: Array[BaseBuilding] = []

func generate():
	for i in range(count_players):
		zones["player_%d" % i] = {
			"deck": [],
			"hand": [],
			"graveyard": [],
			"exile": []
		}
	zones["stack"] = []
	zones["resolve"] = []
	zones["global"] = {
		"deck": [],
		"hand": [], # unused but still
		"graveyard": [],
		"exile": [] # unused but still
	}

func move_card(card: BaseCard, new_zone: GlobalEnums.Zones, position: int):
	var old_zone = card.current_zone
	card.current_zone = new_zone

	var zone_map = {
		GlobalEnums.Zones.DECK: zones[card.owner]["deck"],
		GlobalEnums.Zones.HAND: zones[card.owner]["hand"],
		GlobalEnums.Zones.GRAVEYARD: zones[card.owner]["graveyard"],
		GlobalEnums.Zones.EXILE: zones[card.owner]["exile"],
		GlobalEnums.Zones.STACK: zones["stack"],
		GlobalEnums.Zones.RESOLVE: zones["resolve"]
	}

	if old_zone in zone_map:
		zone_map[old_zone].erase(card)
	
	if new_zone in zone_map:
		if new_zone == GlobalEnums.Zones.DECK:
			zone_map[new_zone].insert(clamp(position, 0, zone_map[new_zone].size()), card)
		else:
			zone_map[new_zone].append(card)

func start():
	pass

func end():
	pass