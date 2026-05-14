extends Node2D
var paredaoVisibilidade = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_voltar_pressed() -> void:
	$ParedaoSobre.visible = false
	paredaoVisibilidade = false
	'''if paredaoVisibilidade == false:
		$ParedaoSobre.visible = true
		paredaoVisibilidade = true
	else:
		$ParedaoSobre.visible = false
		paredaoVisibilidade = false'''


func _on_button_sobre_pressed() -> void:
	$ParedaoSobre.visible = true
	paredaoVisibilidade = true


func _on_button_play_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/cena_escolha/escolhedor.tscn")
