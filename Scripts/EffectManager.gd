extends Node
class_name EffectManager

func setCardFunc(card: CardResource) -> void:
	var source_code: String = """func nullFunc(_a: GameResource, _b: Array[Node], _c: int, _d: Array[GameElement]) -> void:
	pass
func onCast(resource: GameResource, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(card.onCast) + """
func onResolve(resource: GameResource, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(card.onResolve) + """
func onDiscard(resource: GameResource, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(card.onDiscard) + """
func onDraw(resource: GameResource, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(card.onDraw)
	var execute_string_resource := RefCounted.new()
	var execute_string_script := GDScript.new()
	execute_string_script.set_source_code(source_code)
	assert(execute_string_script.reload() == OK)
	execute_string_resource.set_script(execute_string_script)
	card.onCastFunc = Callable(execute_string_resource, "onCast")
	card.onResolveFunc = Callable(execute_string_resource, "onResolve")
	card.onDiscardFunc = Callable(execute_string_resource, "onDiscard")
	card.onDrawFunc = Callable(execute_string_resource, "onDraw")

func setBuildingFunc(building: BuildingResource) -> void:
	var source_code: String = """func nullFunc(_a: GameResource, _b: Array[Node], _c: int, _d: Array[GameElement]) -> void:
	pass
func onBuild(resource: GameResource, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(building.onBuild) + """
func onDestroy(resource: GameResource, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(building.onDestroy) + """
func onUpgrade(resource: GameResource, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(building.onUpgrade) + """
func onTarget(resource: GameResource, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(building.onTarget) + """
func onTurn(resource: GameResource, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(building.onTurn) + """
func onHealthChange(resource: GameResource, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(building.onHealthChange)
	var execute_string_resource := RefCounted.new()
	var execute_string_script := GDScript.new()
	execute_string_script.set_source_code(source_code)
	assert(execute_string_script.reload() == OK)
	execute_string_resource.set_script(execute_string_script)
	building.onBuildFunc = Callable(execute_string_resource, "onBuild")
	building.onDestroyFunc = Callable(execute_string_resource, "onDestroy")
	building.onUpgradeFunc = Callable(execute_string_resource, "onUpgrade")
	building.onTargetFunc = Callable(execute_string_resource, "onTarget")
	building.onTurnFunc = Callable(execute_string_resource, "onTurn")
	building.onHealthChangeFunc = Callable(execute_string_resource, "onHealthChange")

func ifEmpty(fun: String) -> String:
	return "pass" if fun == "" else fun.replace("\n", "\n\t")
