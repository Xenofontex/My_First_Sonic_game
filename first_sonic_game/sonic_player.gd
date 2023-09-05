extends CharacterBody2D

@onready var _animated_sprite = $anim
@onready var jump_sound = $AudioStreamPlayer2D

var look_up = false
var is_jumping = false
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()
		is_jumping = true
		
	elif is_on_floor():
		is_jumping = false
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
		
	if direction:
		velocity.x = direction * SPEED
		_animated_sprite.scale.x = direction
		if !is_jumping:
			_animated_sprite.play("run")
		elif is_jumping:
			_animated_sprite.play("jump")
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		_animated_sprite.play("idle")
	if Input.is_action_pressed("up") and is_on_floor():
			look_up = true
			_animated_sprite.play("look_up")

	move_and_slide()
