extends CharacterBody3D
@export var speed: float = 200
@export var target = WorldManager.Current_Position
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

func Grapple_physics_process(delta: float) -> void:
	if target:
		var direction: Vector3 = global_position.direction_to(target.global_position)
		velocity = direction * speed
	move_and_slide()

# grappling script
func Grapple_gun_ready():
	if GrappleHook.Grapple_Hook_Ready:
		var direction: Vector3 = global_position.direction_to(target)
		velocity = direction * speed
		move_and_slide()
	if not GrappleHook.Grapple_Hook_Ready:
		pass

func Grapple_Gun_Use():
	if Input.is_action_just_pressed("Right_Mouse_Button"):
		Grapple_gun_ready()

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
