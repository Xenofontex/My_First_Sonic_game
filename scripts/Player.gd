extends Area2D

@export var speed = 400
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_just_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_just_pressed("move_left"):
		velocity.x -= 1
	
