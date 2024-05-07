extends CharacterBody2D

# var angle_to_cursor: float;
const ROTATION_SPEED := 8;

const START_SPEED := 100;
const END_SPEED := 700;

var click_held: float;
var click_unheld: float;
var time_to_full_speed = 2.0;
var time_to_stop = 10.0;



# Called when the node enters the scene tree for the first time.
func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var angle_to_cursor = get_angle_to(get_viewport().get_mouse_position());
	rotate(angle_to_cursor * ROTATION_SPEED * delta)

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		click_held += delta
		click_unheld = 0.0;
		velocity = Vector2(lerp(START_SPEED, END_SPEED, click_held/time_to_full_speed), 0).rotated(rotation);
	else:
		click_held = 0.0;
		click_unheld += delta;
		# print(click_unheld/time_to_stop)
		# velocity = lerp(velocity, Vector2(0,0), click_unheld/time_to_stop);
		velocity = lerp(velocity, Vector2(0,0), 0.9);
	# print(velocity)
	move_and_slide()

# func _input(event):
# 	if event is InputEventMouseButton:
# 		if event.button_index == MOUSE_BUTTON_RIGHT:
# 			print('clicked!')
# 			if not event.pressed:
# 				velocity = Vector2(0,0);
