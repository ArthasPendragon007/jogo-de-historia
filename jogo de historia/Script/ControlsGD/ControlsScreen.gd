extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var sceene = load("res://ControlsScreen.gd")
# Called when the node enters the scene tree for the first time.
#func _process(delta):
onready var text:Button = get_node("ControllerV/Fullscreen")
onready var bord = get_node("ControllerV/Borderless")
onready var left = get_node("ControllerV2/ControllerH/Esquerdo")
onready var right = get_node("ControllerV2/ControllerH/Direito")
onready var numb = get_node("ControllerV2/ControllerH/numb")
var x:int
var y:int
var z:int = 100
func _ready():
	$Controller/Return.grab_focus()
func _on_Return_pressed():
	get_tree().current_scene.get_node("CanvasLayer/Controller").show()
#	get_tree().reload_current_scene()


func _on_Fullscreen_pressed():
	if x == 0:
		text.text = ""
		OS.window_fullscreen = !OS.window_fullscreen
		x = 1
	elif x == 1:
		text.text = "X"
		OS.window_fullscreen = !OS.window_fullscreen
		x = 0


func _on_Borderless_pressed():
	if y == 0:
		bord.text = " "
		y = 1
	elif y == 1:
		bord.text = "X"
		y = 0


func _on_Esquerdo_pressed():
	z as int
	z = z - 1
	str(z)
	numb.text = z
	pass # Replace with function body.


func _on_Direito_pressed():
	
	z as int
	z = z + 1 
	str(z)
	numb.text = z
	pass # Replace with function body.
