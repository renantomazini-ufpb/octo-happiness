extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func avisar(texto):
	self.set_visible(true)
	self.text = texto
	$Timer_aviso.start()
	


func _on_timer_aviso_timeout() -> void:
	self.set_visible(false)
