extends Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float):
	if Input.is_action_pressed("ui_up"): #move up control
		position.y += 0.075
	elif Input.is_action_pressed("ui_down"): #move down control
		position.y -= 0.075
	position.y = clamp(position.y, 6, 9)
