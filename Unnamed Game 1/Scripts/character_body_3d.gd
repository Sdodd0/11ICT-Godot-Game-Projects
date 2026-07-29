extends CharacterBody3D
 
var speed = 28.5 #up and down movement speed

func _process(_delta: float) -> void:
	pass

#character controls and data
func _physics_process(_delta):
	position.y = clamp(position.y, -15, 15)
	velocity.y = 0
	velocity.x = 0 #move right at a constant speed
	if Input.is_action_pressed("ui_up"): #move up control
		velocity.y = speed
	elif Input.is_action_pressed("ui_down"): #move down control
		velocity.y = -speed
	if Input.is_action_pressed("R_key"): #force restart control
		restart()

	move_and_slide()

func restart() -> void: #restarts game
	get_tree().change_scene_to_file.call_deferred("res://Assets/ui_view_port.tscn")

func _on_hit_box_area_entered(_Area3D):
	restart()


func _on_hurt_box_area_entered(area: Area3D) -> void:
	get_tree().change_scene_to_file.call_deferred("res://procedural_generation.tscn")

func _on_hitbox_area_entered(area: Area3D) -> void:
	Scoremanager.add_score(5)
