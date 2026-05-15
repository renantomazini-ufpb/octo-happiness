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
	
func set_perc_first_time(perc):
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property($ProgressBar, "value", perc, 2.5)

func set_perc(perc):
	var tween = create_tween()
	tween.tween_interval(3.0)
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property($ProgressBar, "value", perc, 3.0)
	
func get_perc():
	return $ProgressBar.value
