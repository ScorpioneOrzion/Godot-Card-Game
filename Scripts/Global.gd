extends Node

enum DEFAULT_KEYS {
	IGNORE,
	ALWAYSRESOLVE,
	ISCARD,
	TARGETCOUNT,
	TARGETTYPE,
	TARGETGROUP,
	DELAY
}

enum STATE_KEYS {
	COST,
	TIME,
	PASS, # to check if the card can continue resolving, set every turn to false
	DONE, # to remove it from the active cards list
	RESOLVE,
	VARIABLES,
	CURRENTCONTROLLER,
	CURRENTOWNER,
	CURRENTTARGETS
}

# Player-related Data
var players: Array[Player] = []
var current_player_index: int = 0

# Global Deck/Graveyard
var global_deck: Array[BaseCard] = []
var global_graveyard: Array[BaseCard] = []

# Game Databases
var card_database: Dictionary = {}
var building_database: Dictionary = {}

var active_cards: Array[BaseCard] = []

func game_start():
	for card in global_deck:
		card.STATE[STATE_KEYS.CURRENTOWNER] = -1 # -1 means it's in the global deck

func turn_begin_step():
	for i in range(active_cards.size() - 1, -1, -1):
		active_cards[i].on_begin_of_turn()
	active_cards = active_cards.filter(func(x): return x.STATE[STATE_KEYS.DONE] == false)

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
