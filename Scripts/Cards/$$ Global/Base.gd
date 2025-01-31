extends BaseCard
class_name GlobalBaseCard

func _ready():
	super._ready()
	STATE[KEYS.CURRENTCONTROLLER] = -1
	DEFAULTS[KEYS.DELAY] = 1
	DEFAULTS[KEYS.IGNORE] = true
	DEFAULTS[KEYS.ALWAYSRESOLVE] = true
	DEFAULTS[KEYS.TARGETTYPE] = TargetType.NONE