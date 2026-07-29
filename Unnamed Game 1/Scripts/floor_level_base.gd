extends Node3D

func despawn():
	queue_free()

func _process(delta: float):
	position.x -= 25 * delta

func _on_timeout_despawn_timer_timeout() -> void:
	despawn()
