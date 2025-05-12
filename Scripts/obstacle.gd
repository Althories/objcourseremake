extends Area3D

@onready var character = get_node("%CharacterBody3D")

signal collided

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if overlaps_body(character):
		emit_signal("collided")
