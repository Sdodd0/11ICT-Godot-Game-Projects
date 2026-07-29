extends Node3D

const Main_Character = preload("res://main_character.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var instance = Main_Character.instantiate()
	add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_world_boundaries_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
