extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	pass # Replace with function body.

func playHurt():
	if(!self.playing):
		self.stream = load("res://Player/SoundEffects/"+str(rng.randi_range(1,3))+".wav")
		play()
