extends Node2D
var din = 0.0
var dias_devendo = 0
var dias_devendo_total = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_din():
	return "R$" +str(din)

var tween_din

func add_din_first(val):
	var valor_inicial = din
	din += val
	

	if tween_din:
		tween_din.kill()

	tween_din = create_tween()
	tween_din.tween_interval(1.0)
	tween_din.set_trans(Tween.TRANS_SINE)
	tween_din.set_ease(Tween.EASE_OUT)
	
	tween_din.tween_method(
		_atualizar_dinheiro,
		valor_inicial,
		din,
		0.5
	)


func add_din(val):
	var valor_inicial = din
	din += val
	

	if tween_din:
		tween_din.kill()

	tween_din = create_tween()
	tween_din.tween_interval(3.0)
	tween_din.set_trans(Tween.TRANS_SINE)
	tween_din.set_ease(Tween.EASE_OUT)
	
	tween_din.tween_method(
		_atualizar_dinheiro,
		valor_inicial,
		din,
		0.5
	)

func _atualizar_dinheiro(valor):
	$valor_str.text = "R$" + str("%0.2f" % valor)
	
	
func sub_din(val):
	din = din - val
	$valor_str.text = "R$" +str(din)


func set_din(val):
	din = val
	$valor_str.text = "R$" +str(din)
	
func passar_dia():
	if din < 0:
		dias_devendo = dias_devendo + 1
		dias_devendo_total = dias_devendo_total + 1
		if dias_devendo > 3:
			return true
	else:
		dias_devendo = 0
		return false
