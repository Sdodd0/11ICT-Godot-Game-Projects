extends Label

func _process(delta):
	# Updates the text to match the global score every frame
	text = "Score: " + str(Scoremanager.score)
