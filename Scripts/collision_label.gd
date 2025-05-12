extends Label

var collision_count = -1

func _ready():
	text = "Collision Count: %s" % collision_count

func _on_col_count_up() -> void:
	collision_count += 1
	text = "Collision Count: " + str(collision_count)
