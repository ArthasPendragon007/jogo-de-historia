extends Node2D

var selected = false
var rest_point
var rest_nodes = []

#export onready var militar = get_node("militar/milit")

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[0].global_position
	rest_nodes[0].select()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
		
func _physics_process(delta):
	if get_tree().get_nodes_in_group("yes"):
		print_debug() 
	elif get_tree().get_nodes_in_group("no"):
		print_debug() 
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
#		look_at(get_global_mouse_position())
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)
#		rotation = lerp_angle(rotation, 0, 10 * delta)
export(NodePath) onready var militar = get_node("militar/TextureProgress") as TextureProgress
export(NodePath) onready var word = get_node("")
export(int) var health
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = 75
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
#					militar.value =
					child.select()
					rest_point = child.global_position
					shortest_dist = distance
					child.NO()
					if child.NO():
						print_debug()
					child.YES()
					if child.YES():
						var carta:= get_node(".")
						emit_signal("check")
signal check
#				if childs.select()
