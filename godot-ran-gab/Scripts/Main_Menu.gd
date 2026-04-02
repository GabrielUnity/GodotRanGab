extends Control

var mode = "solo"

var solo_button
var vs_button
var play_button

func _ready():
	# Leia nupud
	solo_button = get_node("Solo")
	vs_button = get_node("VS")
	play_button = get_node("Play")

	if not solo_button or not vs_button or not play_button:
		push_error("ERROR: Üks või mitu nuppu ei leitud!")
		return

	# Ühenda signaalid
	solo_button.pressed.connect(_on_solo_pressed)
	vs_button.pressed.connect(_on_vs_pressed)
	play_button.pressed.connect(_on_play_pressed)

	# Alguses värvid
	update_button_colors()

# --- Nupuvajutused ---
func _on_solo_pressed():
	mode = "solo"
	update_button_colors()

func _on_vs_pressed():
	mode = "vs"
	update_button_colors()

func _on_play_pressed():
	if mode == "solo":
		get_tree().change_scene_to_file("res://MainScene.tscn")
	else:
		print("Multiplayer not ready yet")

# --- Funktsioon nupuvärvide uuendamiseks ---
func update_button_colors():
	# Solo nupp: heledam ainult kui valitud
	if mode == "solo":
		solo_button.modulate = Color(0.7,0.7,1)  # heledam sinine
	else:
		solo_button.modulate = Color(1,1,1)      # vaikimisi valge

	# VS nupp: heledam ainult kui valitud
	if mode == "vs":
		vs_button.modulate = Color(0.8,0.8,1)    # natuke heledam
	else:
		vs_button.modulate = Color(1,1,1)        # vaikimisi valge

	# Play nupp jääb alati valgeks
	play_button.modulate = Color(1,1,1)
