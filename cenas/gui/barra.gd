extends Node2D
#var nome = "teste"
#var perc = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_nome(name):
	$ProgressBar/Label.text = name
	
func get_nome():
	return $ProgressBar/Label.text

func set_perc(perc):
	$ProgressBar.value = perc
	
func get_perc():
	return $ProgressBar.value
