extends CharacterBody3D


const SPEED = 10.0
const JUMP_VELOCITY = 4.5

signal col_count_up
signal stop
signal restart

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		get_tree().quit()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	#Make CamController match position of character
	#lerp(where we start, where we end, how quickly)
	$CamController.position = lerp($CamController.position, position, .07)

	move_and_slide()

func _on_obstacle_body_entered(_body: Node3D) -> void:
	position = Vector3(-23, 0, 23)
	emit_signal("col_count_up")
	emit_signal("restart")


func _on_finish_zone_body_entered(_body: Node3D) -> void:
	emit_signal("stop")
