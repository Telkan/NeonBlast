extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	scale[0]=get_parent().hp

func _process(_delta):
	global_position = get_parent().global_position + Vector2(0,-20)
	
func resizeHealth():
	scale[0]=get_parent().hp
