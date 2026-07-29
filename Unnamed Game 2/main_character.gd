extends CharacterBody3D


@export var speed: float = 200
@onready var target1 = $Grapple_Hook
@export var mouse_sensitivity: float = 0.002
@export var min_pitch: float = -89.0
@export var max_pitch: float = 89.0
@onready var camera: Camera3D = $Camera3D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		
		camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, min_pitch, max_pitch)

func _physics_process(delta: float) -> void:
# Constants
	const SPEED = 5.0
	const JUMP_VELOCITY = 4.5

# Handle gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

# Handle grappling gun
	if Input.is_action_just_pressed("Right_Mouse_Button"):
		if GrappleHook.Grapple_Hook_Ready == true:
			var grapple_direction: Vector3 = global_position.direction_to(target1)
			velocity = grapple_direction * speed
		if GrappleHook.Grapple_Hook_Ready == false:
			pass

# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

# Handle player movement
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
