extends Label

#I don't know what's causing it but the signal fires once on ready() per obstacle in scene.
#The negative count here should reflect the number of obstacle nodes in the scene

var time = 0.0
var stop = false

func _ready():
	pass

func _process(delta):
	if stop == false:
		time += delta
	text = str(snappedf(time, .01))

func _on_stop() -> void:
	stop = true

func _on_restart() -> void:
	time = 0.0
