extends Node



func tirar_lencol():
	var tam = $colchao/lencol.transform.get_scale()
	for n in range(5):
		$colchao/lencol/Timer.start()
		tam = tam - Vector2(0.0,0.2)
	$colchao/lencol.apply_scale(Vector2(1.0,0))
	
	
func colocar_lencol():
	
	$colchao/lencol.transform.set_scale(1.0,1.0)
	
func _ready() -> void:
	tirar_lencol()
