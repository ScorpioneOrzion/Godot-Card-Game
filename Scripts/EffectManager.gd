extends Node
class_name EffectManager

var nullFunc: Callable = Callable()

func generate_func(resource: GameResource) -> void:
	if resource is CardResource:
		resource.onCastFunc = get_func(resource.onCast)
		resource.onResolveFunc = get_func(resource.onResolve)
		resource.onDiscardFunc = get_func(resource.onDiscard)
		resource.onDrawFunc = get_func(resource.onDraw)
	elif resource is BuildingResource:
		resource.onBuildFunc = get_func(resource.onBuild)
		resource.onDestroyFunc = get_func(resource.onDestroy)
		resource.onUpgradeFunc = get_func(resource.onUpgrade)
		resource.onTargetFunc = get_func(resource.onTarget)
		resource.onTurnFunc = get_func(resource.onTurn)
		resource.onHealthChangeFunc = get_func(resource.onHealthChange)

func get_func(func_string: String) -> Callable:
	if func_string == "":
		return nullFunc
	else:
		print("Generating function: \"" + func_string + "\"")
		return string_to_callable(func_string) # placeholder (see below)

# example found to convert a string to a callable function
# will have to make it simpler to work with the way I'm doing it
class FuncHolder:
	var ref: RefCounted
	var func_script: Script

	func _init(new_ref: RefCounted, new_script: Script) -> void:
		ref = new_ref
		func_script = new_script

var functions: Array[FuncHolder] = []

func string_to_callable(func_string: String) -> Callable:
	var execute_string_resource := RefCounted.new();
	var execute_string_script := GDScript.new();
	var new_source_code: String = "var base_node: Node\n"
	if not func_string.begins_with("\n"):
		new_source_code += "\n"
	new_source_code += func_string
	print(new_source_code)
	execute_string_script.set_source_code(new_source_code)
	assert(execute_string_script.reload() == OK)
	execute_string_resource.set_script(execute_string_script)
	execute_string_resource.base_node = self
	var func_name = func_string.right(-6).get_slice("(", 0)
	var this_func := FuncHolder.new(execute_string_resource, execute_string_script)
	functions.append(this_func)
	return Callable(this_func, func_name)
