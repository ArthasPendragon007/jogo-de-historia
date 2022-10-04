extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var tween1:Tween = get_node("satisfacao/Tween")
onready var tween2:Tween = get_node("militar/Tween")
onready var tween3:Tween = get_node("economia/Tween")
onready var militar_health = get_node("militar/TextureProgress")
onready var satisfacao_health = get_node("satisfacao/TextureProgress")
onready var economia_healt = get_node ("economia/TextureProgress")
func _ready():
	init_bar()
	for n in 6:
		var carta = get_node("carta" + str(n))
		carta.hide()

signal militar()
var bar = 100
var current_health:int
var x = RandomNumberGenerator.new()
#export(int)var current_health = bar

func init_bar():
	yield(get_parent(), "ready")
	militar_health.max_value = bar
	militar_health.value = bar
	current_health = bar
export onready var militar = get_node("militar")
# Called when the node enters the scene tree for the first time.
func update_bar(value:int) -> void:
	call_tween(current_health, value)
	current_health = value
func call_tween(old_value:int, new_value:int) -> void:
	
	var _interpolate_value:bool = tween1.Interpolate_property(current_health,"value", old_value,new_value,0.4,Tween.TRANS_QUAD,Tween.EASE_IN_OUT)
	var stats:bool = tween1.start()
signal satisfacao
onready var satisfacao = get_node("satisfacao")
signal economia
onready var economia = get_node("economia")
var y
func _on_carta_check():
#		carta.queue_free()
		x = randi()%5+0
		y = x
		var carta = get_node("carta"+ str(x))
		carta.show()
		print("rand ", x)
		
		pass
		
		if get_tree().get_root().get_node(".").find_node("carta"):
			print_debug(carta)
#	pass # Replace with function body.

var rest_node = []
func _on_check_tree_exiting():
	emit_signal("ready")
	var carta = get_node("carta"+str(y))
	connect("ready", carta,"tree_exiting")
