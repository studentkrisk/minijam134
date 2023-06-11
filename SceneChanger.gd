extends CanvasLayer

func change_scene_to(target):
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("dissolve")

func slide_change_scene_to(target):
	$AnimationPlayer.play("slide_start")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("slide_end")
	
