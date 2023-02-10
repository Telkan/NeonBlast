extends AudioStreamPlayer


var rng = RandomNumberGenerator.new()

var listOfMusic = ["res://Ressources/music/1.mp3","res://Ressources/music/2.mp3","res://Ressources/music/3.mp3"]

var currentMusic

func _ready():
	randomize() 
	currentMusic = 0
	rng.randomize()
	listOfMusic.shuffle()
	stream = load(listOfMusic[currentMusic])
	playing = true
	pass # Replace with function body.


func _on_AudioStreamPlayer_finished():
	currentMusic+=1
	if currentMusic >= listOfMusic.size()-1:
		currentMusic = 0
		listOfMusic.shuffle()
		
	stream = load(listOfMusic[currentMusic])
	playing = true
	pass # Replace with function body.
