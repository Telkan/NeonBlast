extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func die():
	get_parent().queue_free()
