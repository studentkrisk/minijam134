extends Node2D

func _ready():
	Global.islands = []

func _on_touch_screen_button_pressed():
	print("yes")

func _on_tutorial_pressed():
	print("yes")
	SceneChanger.change_scene_to("res://World/tutorial.tscn")

func _on_play_pressed():
	SceneChanger.change_scene_to("res://World/world.tscn")

func _on_credits_pressed():
	SceneChanger.change_scene_to("res://World/credits.tscn")
