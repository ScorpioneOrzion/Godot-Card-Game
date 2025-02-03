extends BaseCard
class_name GlobalBaseCard

func _ready():
	super._ready()
	STATE[KEYS.CURRENTCONTROLLER] = -1
	DATA[KEYS.DELAY] = 1
	DATA[KEYS.IGNORE] = true
	DATA[KEYS.ALWAYSRESOLVE] = true
	DATA[KEYS.TARGETTYPE] = TargetType.NONE