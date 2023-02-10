extends Camera2D


var player
var resetReady = false
# Called when the node enters the scene tree for the first time.

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey and event.pressed:
		if(resetReady):
			get_tree().change_scene("res://World.tscn")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!is_instance_valid(player)):
		current = true
		if($Timer.is_stopped()):
			$Timer.start()

		
		$CanvasLayer/EndDisplay.set_visible(true)
		$CanvasLayer/EndDisplay.text = "Score:"+str(get_tree().get_nodes_in_group("Score")[0].getScore())+"\n\nPress any key to restart"


	pass


func _on_Timer_timeout():
	resetReady = true
	pass # Replace with function body.
