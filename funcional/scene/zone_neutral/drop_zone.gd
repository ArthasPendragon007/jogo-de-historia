extends Position2D

signal correct()
export var correct = false

func _draw():
	draw_circle(Vector2.ZERO, 75, Color.blanchedalmond)
	modulate.a = 0.05
	
func select():
	print("neutral")
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
	modulate = Color.webmaroon
	modulate.a = 0.05
	if correct:
		emit_signal("correct")
	
func deselect():
	modulate = Color.white
	modulate.a = 0.05
func NO():
#	print_debug()
	return false
func YES():
#	print_debug()
	return false
