extends Node3D

var Grapple_Hook_Ready

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_grappling_hook_area_area_entered(area: Area3D) -> void:
	Grapple_Hook_Ready = true


func _on_grappling_hook_area_area_exited(area: Area3D) -> void:
	Grapple_Hook_Ready = false
