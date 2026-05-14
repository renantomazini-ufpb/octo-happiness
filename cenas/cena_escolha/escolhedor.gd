extends Node2D

const CharsDBScript = preload("res://cenas/cena_escolha/CharsDB.gd")
var CharsDB = CharsDBScript.new()

func _ready():

	for p in CharsDB.personagens:

		var personagem = p["cena"].instantiate()

		var sprite = personagem

		var textura = sprite.sprite_frames.get_frame_texture(
			"Respirando_frente",
			0
		)

		$ItemList.add_item(p["nome"], textura)

		personagem.queue_free()

	$ItemList.item_selected.connect(_selecionado)


func _selecionado(index):

	var p = CharsDB.personagens[index]

	#print(p["nome"])
	#print(p["curso"])
	pass


func _on_item_list_focus_entered() -> void:
	pass # Replace with function body.

var personagem_selecionado = null
func _on_item_list_item_selected(index: int) -> void:
	personagem_selecionado = CharsDB.personagens[index]
	var p = CharsDB.personagens[index]
	$Nome.set_visible(true)
	$Curso.set_visible(true)
	$Desc.set_visible(true)
	$Nome.text = p["nome"]
	$Curso.text = p["curso"]
	$Desc.text = p["descricao"]


func _on_button_play_pressed() -> void:
	if personagem_selecionado == null:
		return
	Global.personagem = personagem_selecionado
	get_tree().change_scene_to_file("res://cenas/gui/status.tscn")
	
