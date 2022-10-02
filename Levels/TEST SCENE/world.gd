extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var shape = null
# Called when the node enters the scene tree for the first time.
func _input(event):
	
	if event is InputEventMouseButton:
		if event.is_pressed():
			shape = find_colliding_shape(event.position)
			print_debug("print ", shape)
			if shape == null:
				return
			shape.dragging = true
		elif shape != null:
			shape.apply_impulse(Vector2(0,0), Vector2(0,1))
			shape.dragging = false
			for node in get_node("Shapes").get_children():
				node.set_sleeping(false)
			shape = null
	elif event is InputEventMouseMotion and shape != null:
		if shape.translate_by == null:
			shape.translate_by = Vector2(0,0)
		shape.translate_by += event.get_relative()
		for node in get_node("Shapes").get_children():
			node.set_sleeping(false)

func find_colliding_shape(pos):
	var pointer = get_node("Pointer")
	pointer.set_position(pos)
	var pointer_shape = pointer.shape_owner_get_shape(0,0)
	var pointer_transform = pointer.get_transform()
	for node in get_node("Shapes").get_children():
		var shape = node.shape_owner_get_shape(0,0)
		var res = shape.collide(node.get_transform(), pointer_shape, pointer_transform)
		print_debug()
		print ("res" , res)
#		res = true
		if res:
			print_debug()
			print ("pointer ", pointer)
			return node
	return null
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
