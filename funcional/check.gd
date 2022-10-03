extends Node2D


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

signal militar()
var bar = 100
var current_health:int
func init_bar():
	yield(get_parent(), "ready")
	militar_health.max_value = bar
	militar_health.value = bar
	current_health = bar
onready var militar = get_node("militar")
# Called when the node enters the scene tree for the first time.

func _ready():
	pass
func call_tween(old_value:int, new_value:int) -> void:
	
	var _interpolate_value:bool = tween1.Interpolate_property(militar,"value", old_value)
signal satisfacao
onready var satisfacao = get_node("satisfacao")
signal economia
onready var economia = get_node("economia")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
