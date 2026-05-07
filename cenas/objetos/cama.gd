extends Node

func tirar_lencol():
	for n in range(5):
		var tam = $colchao/lencol.scale
		tam -= Vector2(0.0, 0.2)
		$colchao/lencol.scale = tam
		
		$colchao/lencol/Timer.start()
		await $colchao/lencol/Timer.timeout

func colocar_lencol():
	$colchao/lencol.scale = Vector2(1.0, 1.0)

func _ready() -> void:
	pass
