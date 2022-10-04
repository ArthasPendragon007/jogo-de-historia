extends Position2D

signal correct()
export var correct = false

func _draw():
	draw_circle(Vector2.ZERO, 75, Color.blanchedalmond)
	modulate.a = 0.5
	
func select():
	print("no")
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
	modulate = Color.webmaroon
	modulate.a = 0.05
	if correct:
		emit_signal("correct")
	
func deselect():
	modulate = Color.red
	modulate.a = 0.5
func YES():
	return false
func NO():
	return true


