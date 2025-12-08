extends Node


func _ready() -> void:
	var compile_path : String = "res://compiled_script.gdc"
	var byte := BytecodeCompiler.new()
	var packed : PackedByteArray = byte.compile_from_script(load("res://test_script.gd"))
	var file : FileAccess = FileAccess.open(compile_path,FileAccess.WRITE)
	if file:
		file.store_buffer(packed)
		file.close()
	
	if FileAccess.file_exists(compile_path):
		var value : Variant = load(compile_path)
		if value is RefCounted:
			value.new()
			print("Test passed!")
			return
	print("Something is wrong!")
