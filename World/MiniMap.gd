extends ColorRect

var island = Sprite2D.new()
var sprite = preload("res://Art/CannonBall.png")
var generated_sprites = false
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not generated_sprites and len(Global.islands) == Global.num_islands:
		island.texture = sprite
		for i in Global.islands:
			var copy = island.duplicate()
			add_child(copy)
			generated_sprites = true
	var children = get_children()
	children.erase($Player)
	print(len(children))
	for i in range(len(children)):
		children[i].position = size*((Global.islands[i] - Global.player.position)/(Vector2(32, 32)*16)/2 + Vector2(0.5, 0.5))
