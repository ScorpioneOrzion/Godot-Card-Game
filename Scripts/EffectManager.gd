extends Node
class_name EffectManager

func setCardFunc(card: CardResource) -> void:
	var source_code: String = """func nullFunc(_a: GameElement, _b: Array[Node], _c: int, _d: Array[GameElement]) -> void:
	pass
func onCast(resource: GameElement, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(card.onCast) + """
func onResolve(resource: GameElement, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(card.onResolve) + """
func onDiscard(resource: GameElement, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(card.onDiscard) + """
func onDraw(resource: GameElement, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(card.onDraw) + """
func onTurn(resource: GameElement, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(card.onTurn)
	var execute_string_resource := RefCounted.new()
	var execute_string_script := GDScript.new()
	execute_string_script.set_source_code(source_code)
	assert(execute_string_script.reload() == OK)
	execute_string_resource.set_script(execute_string_script)
	card.onCastFunc = Callable(execute_string_resource, "onCast")
	card.onResolveFunc = Callable(execute_string_resource, "onResolve")
	card.onDiscardFunc = Callable(execute_string_resource, "onDiscard")
	card.onDrawFunc = Callable(execute_string_resource, "onDraw")
	card.onTurnFunc = Callable(execute_string_resource, "onTurn")

func setBuildingFunc(building: BuildingResource) -> void:
	var source_code: String = """func nullFunc(_a: GameElement, _b: Array[Node], _c: int, _d: Array[GameElement]) -> void:
	pass
func onBuild(resource: GameElement, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(building.onBuild) + """
func onDestroy(resource: GameElement, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(building.onDestroy) + """
func onUpgrade(resource: GameElement, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(building.onUpgrade) + """
func onTarget(resource: GameElement, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(building.onTarget) + """
func onTurn(resource: GameElement, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
	nullFunc(resource, players, currentController, targets)
	""" + ifEmpty(building.onTurn) + """
func onHealthChange(resource: GameElement, players: Array[Node], currentController: int, targets: Array[GameElement]) -> void:
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
