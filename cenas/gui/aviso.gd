extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func avisar(texto):
	self.visible = true
	self.modulate.a = 1.0
	self.text = texto
	
	await get_tree().create_timer(5.0).timeout
	
	# fade out
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 1.5)
	
	await tween.finished
	
	self.visible = false
