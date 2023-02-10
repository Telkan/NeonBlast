extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0
func addScore(value):
	score+=value
	text = "Score:"+str(score)

func getScore():
	return score
