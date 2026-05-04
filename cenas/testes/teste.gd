extends AnimatedSprite2D
var hoz = false
var pos = self.get_position()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.frame < 5:
		pos = pos + Vector2(3,0)
		self.set_position(pos)
	if self.frame > 5:
		pos = pos + Vector2(-3,0)
		self.set_position(pos)
