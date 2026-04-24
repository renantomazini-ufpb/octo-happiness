extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$fome.set_perc(100.00)
	$fome.set_nome("FOME")
	$estresse.set_perc(0.00)
	$estresse.set_nome("ESTRESSE")
	$sono.set_perc(100.00)
	$sono.set_nome("SONO")
	$social.set_perc(50.00)
	$social.set_nome("SOCIAL")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

#abaixo apenas um teste 
func _on_timer_timeout() -> void:
	print("contou")
	$estresse.set_perc($estresse.get_perc() + 5.5)
	$Money.set_din(($Money.get_din()).to_float() + 4.21)
	#$Timer.play()
