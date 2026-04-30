extends Node2D
var din = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_din():
	return "R$" +str(din)

func add_din(val):
	din = din + val
	$valor_str.text = "R$" +  str("%0.2f" % din) 

func sub_din(val):
	din = din - val
	$valor_str.text = "R$" +str(din)


func set_din(val):
	din = val
	$valor_str.text = "R$" +str(din)
	
