extends Node3D

func despawn():
	queue_free()

func _process(delta: float):
	position.x -= 25 * delta

func _on_timeout_despawn_timer_timeout() -> void:
	despawn()


func _on_hit_box_area_entered(_area: Area3D) -> void:
	get_tree().reload_current_scene()


func _on_hitbox_area_entered(_area: Area3D) -> void:
	get_tree().reload_current_scene()
