extends Node2D

@onready var camera = $Camera2D;

const CAMERA_SPEED: float = 10.0;

func _ready():
	print('hello world!')

# func _process(delta: float):
	# print('delta', delta)

func _input(_event):
	# if Input.is_action_pressed("ui_right"):
	# 	camera.position.x += CAMERA_SPEED;
	# if Input.is_action_pressed("ui_left"):
	# 	camera.position.x -= CAMERA_SPEED;
	# if Input.is_action_pressed("ui_up"):
	# 	camera.position.y -= CAMERA_SPEED;
	# if Input.is_action_pressed("ui_down"):
	# 	camera.position.y += CAMERA_SPEED;

	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit();