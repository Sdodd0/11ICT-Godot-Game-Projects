extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_area_3d_body_exited(body: Node3D) -> void:
	get_tree().reload_current_scene.call_deferred()
