extends Node

enum KEYS {
	IGNORE,
	ALWAYSRESOLVE,
	ISCARD,
	TARGETCOUNT,
	TARGETTYPE,
	TARGETGROUP,
	DELAY,
	UPGRADE,
	COST,
	TIME,
	FLAGS,
	PASS,
	DONE,
	RESOLVE,
	VARIABLES,
	CURRENTCONTROLLER,
	CURRENTOWNER,
	CURRENTTARGETS,
	CURRENTHEALTH,
	MAXHEALTH
}

enum FLAGS {
	CAPITAL,
}

# Player-related Data
var players: Array[Player] = []
var current_player_index: int = 0

# Global Deck/Graveyard
var global_deck: Array[GlobalBaseCard] = []
var global_graveyard: Array[GlobalBaseCard] = []

# Game Databases
var card_database: Array[BaseCard] = []
var building_database: Array[BaseCard] = []

var active_cards: Array[BaseCard] = []

func _ready() -> void:
	print(dir_contents("res://Scripts/Cards"))

func dir_contents(path):
	var dir = DirAccess.open(path)
	var contents = []
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if (dir.current_is_dir()):
			contents += dir_contents(path + "/" + file_name).map(func(x): return file_name + "/" + x)
		else:
			contents.append(file_name)
		file_name = dir.get_next()
	dir.list_dir_end()
	return contents

func game_start():
	for card in global_deck:
		card.STATE[KEYS.CURRENTOWNER] = -1 # -1 means it's in the global deck

func turn_begin_step():
	for i in range(active_cards.size() - 1, -1, -1):
		active_cards[i].on_begin_of_turn()
	active_cards = active_cards.filter(func(x): return x.STATE[KEYS.DONE] == false)

func turn_end_step():
	for i in range(active_cards.size() - 1, -1, -1):
		active_cards[i].on_end_of_turn()
	

func draw_global():
	if global_deck.size() == 0:
		# cardManager.get_by_name("")
		shuffle_global()
	
	var card = global_deck.pop_front()
	card.on_cast()

func shuffle_global():
	for card in global_graveyard:
		global_deck.push_back(card)
	global_graveyard.clear()
	global_deck.shuffle()
