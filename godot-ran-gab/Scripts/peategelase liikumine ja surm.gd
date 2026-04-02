extends CharacterBody2D

var speed = 1000

func _physics_process(delta):
	# Liikumine nooltega
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1

	velocity = input_vector.normalized() * speed
	move_and_slide()

	# --- Physics collision check Red tegelasega ---
	var space_state = get_world_2d().direct_space_state

	var shape_query = PhysicsShapeQueryParameters2D.new()
	shape_query.shape = $CollisionShape2D.shape
	shape_query.transform = Transform2D(0, global_position)
	shape_query.collide_with_bodies = true
	shape_query.collision_mask = 0b10  # Red tegelase layer

	var result = space_state.intersect_shape(shape_query, 1)  # max_results = 1

	if result.size() > 0:
		print("Kokkupõrge Rediga!")
		get_tree().change_scene_to_file("res://MainMenu.tscn")
