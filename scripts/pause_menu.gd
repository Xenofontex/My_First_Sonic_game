extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true


func _on_resume_btn_pressed():
	get_tree().paused = false
	visible = false  # Replace with function body.


func _on_restart_btn_pressed():
	pass


func _on_quit_btn_pressed():
	get_tree().quit() # Replace with function body.
