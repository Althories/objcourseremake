extends Label

#I don't know what's causing it but the signal fires once on ready() per obstacle in scene.
#The negative count here should reflect the number of obstacle nodes in the scene

var collision_count = -61

func _ready():
	text = "Collision Count: %s" % collision_count

func _on_col_count_up() -> void:
	collision_count += 1
	text = "Collision Count: " + str(collision_count)
