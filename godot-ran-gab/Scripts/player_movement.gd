extends CharacterBody2D

@export var speed = 400
@export var gravity = 0

#func _input(event: InputEvent) -> void:
	#if event is InputEventKey:
		#if event is Key.A
			#print("left")

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		print("right")
		direction.x = 1

	if Input.is_action_pressed("ui_left"):
		print("left")
		direction.x = -1
		
	if Input.is_action_pressed("ui_up"):
		print("right")
		direction.y = -1

	if Input.is_action_pressed("ui_down"):
		print("left")
		direction.y = 1
	#print(direction)
	velocity = direction * speed

	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()
	
