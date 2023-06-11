extends Node2D
"Shoot"
func _process(delta):
	if(Input.is_action_just_pressed("Shoot")):
		SceneChanger.change_scene_to("res://World/starting_screen.tscn")
