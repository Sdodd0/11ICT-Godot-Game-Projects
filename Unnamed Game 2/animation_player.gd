extends AnimationPlayer

var grapple_animation_ready
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("Grapple_Hook_Pulse")

func _on_grappling_hook_area_area_entered(area: Area3D) -> void:
	play("Grapple_Hook_Ready")


func _on_grappling_hook_area_area_exited(area: Area3D) -> void:
	play("Grapple_Hook_Pulse")
