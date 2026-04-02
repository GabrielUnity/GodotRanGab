extends CharacterBody2D

var speed = 1000                # liikumiskiirus pikslites sekundis
var direction = Vector2.ZERO   # praegune liikumissuund
var change_interval = 1.5      # sekundites, kui tihti suunda vahetada
var timer = 0.0

# ekraani piirid
var screen_width = 1080
var screen_height = 1920
var margin = 50                # kui lähed serva, muutub suund

func _ready():
	randomize()
	_pick_new_direction()

func _process(delta):
	# liigu praeguse suuna järgi
	velocity = direction * speed
	move_and_slide()
	
	# kontrolli piire
	_check_bounds()
	
	# ajasta suuna vahetus
	timer += delta
	if timer >= change_interval:
		timer = 0
		_pick_new_direction()

func _pick_new_direction():
	# vali juhuslik suund
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func _check_bounds():
	# kui tegelane läheneb ekraani servale, muudame suunda
	if global_position.x < margin:
		direction.x = abs(direction.x)
	elif global_position.x > screen_width - margin:
		direction.x = -abs(direction.x)
	
	if global_position.y < margin:
		direction.y = abs(direction.y)
	elif global_position.y > screen_height - margin:
		direction.y = -abs(direction.y)
