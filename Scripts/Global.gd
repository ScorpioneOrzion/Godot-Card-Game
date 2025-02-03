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
	CURRENTZONE,
	CURRENTTARGETS,
	CURRENTHEALTH,
	MAXHEALTH
}

enum FLAGS {
	CAPITAL,
}

@onready var manager = GameManager.new()

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
