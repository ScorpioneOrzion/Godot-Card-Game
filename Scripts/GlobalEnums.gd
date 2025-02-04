extends Node

enum Zones {
	DECK,
	HAND,
	GRAVEYARD,
	EXILE,
	STACK,
	RESOLVE
}

enum TurnPhases {
	START,
	MAIN,
	END
}

enum Keys {
	ATTRIBUTES,
	VARIABLES,
	OWNER,
	FLAGS,

	HEALTH,
	MAXHEALTH,

	ZONE,
	TARGETCOUNT,
	TARGETTYPE,
	TARGETGROUP,
	DELAY,
	COST,

	TIME,
	RESOLVE,
	CURRENTTARGETS
}

enum Attributes {
	CAPITAL,
}

enum TargetType {
	SELF,
	ENEMY,
	ANY,
	NONE
}

enum TargetGroup {
	PLAYER,
	CARD,
	BUILDING
}