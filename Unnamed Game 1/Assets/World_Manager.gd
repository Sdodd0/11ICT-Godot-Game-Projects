extends Node3D

var gamestart: bool = false

func _on_button_pressed():
	gamestart = true

const emptychunk = preload("res://Assets/empty_chunk.tscn")
const chunk1 = preload("res://Assets/level_chunk.tscn")
const chunk2 = preload("res://Assets/level_chunk_2.tscn")
const Chunk3 = preload("res://Assets/level_chunk_3.tscn")
const Chunk4 = preload("res://Assets/level_chunk_4.tscn")
const chunk5 = preload("res://Assets/level_chunk_5.tscn")
const chunk6 = preload("res://chunk_6.tscn")

var chunks: Array[PackedScene] = [chunk1,chunk2,Chunk3,Chunk4,chunk5,]

func load_random_chunk():
	var load_chunk: PackedScene = chunks.pick_random()
	var chunk_instance = load_chunk.instantiate()
	add_child(chunk_instance)
	chunk_instance.position = Vector3(150,0,0)

func Firstchunk():
	var load_chunk: PackedScene = emptychunk
	var chunk_instance = load_chunk.instantiate()
	add_child(chunk_instance)
	chunk_instance.position = Vector3(0,0,0)

	var load_chunk2: PackedScene = emptychunk
	var chunk_instance2 = load_chunk2.instantiate()
	add_child(chunk_instance2)
	chunk_instance2.position = Vector3(75,0,0)

func start_generating():
	var load_chunk: PackedScene = chunks.pick_random()
	var chunk_instance = load_chunk.instantiate()
	add_child(chunk_instance)
	chunk_instance.position = Vector3(75,0,0)

func load_empty_chunk():
	var load_chunk: PackedScene = emptychunk
	var chunk_instance = load_chunk.instantiate()
	add_child(chunk_instance)
	chunk_instance.position = Vector3(150,0,0)

func _ready():
	Scoremanager.set_score()
	gamestart = false
	Firstchunk()
	load_empty_chunk()

func _on_level_chunk_new_chunk_signal():
	pass

func _process(_delta: float) -> void:
	pass

func _on_chunk_loader_timer_timeout() -> void:
	if gamestart:
		load_random_chunk()
	if not gamestart:
		load_empty_chunk()
