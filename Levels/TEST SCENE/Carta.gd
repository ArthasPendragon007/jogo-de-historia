extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var translate_by = null
var dragging =  false
# Called when the node enters the scene tree for the first time.
func _integrate_forces(state):
	if  dragging:
		state.set_linear_velocity(Vector2.ZERO)
		state. set_angular_velocity(0)
	if translate_by:
		var t = state.get_transform()
		state.set_transform(
			Transform2D(
				t.get_rotation(), 
				t.get_origin()  + translate_by
			)
		)
		translate_by = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
