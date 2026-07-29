extends Node3D

var gamestart: bool = false

func _on_button_pressed():
	gamestart = true

const emptychunk = preload("res://Assets/empty_chunk.tscn")

const tree1 = preload("res://tree_1.tscn")
const tree2 = preload("res://tree_2.tscn")
const tree3 = preload("res://tree_3.tscn")
const tree4 = preload("res://tree_4.tscn")

var trees: Array[PackedScene] = [tree1,tree2,tree3,tree4]

func load_random_seed():
	var load_tree: PackedScene = trees.pick_random()
	var tree_instance = load_tree.instantiate()
	add_child(tree_instance)
	tree_instance.position = Vector3(75,0,0)
	
	var load_tree2: PackedScene = trees.pick_random()
	var tree_instance2 = load_tree2.instantiate()
	add_child(tree_instance2)
	tree_instance.position = Vector3(75,0,0)

func Firstchunk():
	var load_chunk: PackedScene = emptychunk
	var chunk_instance = load_chunk.instantiate()
	add_child(chunk_instance)
	chunk_instance.position = Vector3(0,0,0)

func start_generating_seed():
	var load_tree: PackedScene = trees.pick_random()
	var tree_instance = load_tree.instantiate()
	add_child(tree_instance)
	tree_instance.position = Vector3(75,0,0)

func load_empty_chunk():
	var load_chunk: PackedScene = emptychunk
	var chunk_instance = load_chunk.instantiate()
	add_child(chunk_instance)
	chunk_instance.position = Vector3(75,0,0)

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
		load_empty_chunk()
		load_random_seed()
	if not gamestart:
		load_empty_chunk()
