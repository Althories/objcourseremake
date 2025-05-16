extends Area3D

#Connect body_entered() signal to character!

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Calling the child animationplayer node
	$AnimationPlayer.play("SPIN")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
