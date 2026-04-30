extends Node2D
const ItensDB = preload("res://scripts/ItensDB.gd")
var nome = ''
var curso_nome = ''
var fomev = 33.00
var sedev = 100.00
var estressev = 0.0
var energiav = 100.00
var socialv = 50.00
var money = 0.0
var level_prof = 1
var estudo_level = 1.0
var curso = 0.0
var dia = 0
var minutos = 720
@onready var itens = ItensDB.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$fome.set_perc(fomev)
	$fome.set_nome("FOME")
	$estresse.set_perc(estressev)
	$estresse.set_nome("ESTRESSE")
	$energia.set_perc(energiav)
	$energia.set_nome("ENERGIA")
	$social.set_perc(socialv)
	$social.set_nome("SOCIAL")
	$sede.set_perc(sedev)
	$sede.set_nome("SEDE")
	
	$aviso.avisar("testando")
	
func add_fome(valor):
	fomev = fomev + valor
	$fome.set_perc(fomev)
	
func add_estresse(valor):
	estressev = estressev + valor
	$estresse.set_perc(estressev)
	
func add_energia(valor):
	energiav = energiav + valor
	$fome.set_perc(energiav)
	
func add_social(valor):
	socialv = socialv + valor
	$social.set_perc(socialv)
	
func add_sede(valor):
	sedev = sedev + valor
	$sede.set_perc(sedev)
	
	
func set_nome(nomestr):
	nome = nomestr
	$nome_sobrenome.text = nome
	
func set_curso_nome(curso_nomestr):
	curso_nome = curso_nomestr
	$curso.text = curso_nome
	
func add_money(valor):
	$Money.set_din(valor)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

#abaixo apenas um teste 
func _on_timer_timeout() -> void:
	print("contou")
	minutos += 10
	controle_horario(minutos)
	add_fome(-20)
	#$estresse.set_perc($estresse.get_perc() + 1.5)
	#$Money.set_din(($Money.get_din()).to_float() + 1.12)
	#$Timer.play()

func controle_horario(minutos_):
	var hora = minutos/60
	var minute = minutos%60
	if minutos >= 1440:
		minutos = 0
		dia = dia + 1
		$dia.text = str(dia)
	if minute == 0:
		minute = "00"
	var strhor = str(hora) + ":" + str(minute)
	$hora_label.text = strhor
	print(strhor)

	


func _on_botoes_comer_menu() -> void:
	print("rodou?")
	add_fome(100)


func _on_button_3_pressed() -> void:
	$Money.set_din(3100.21)




func carregar_lista(lista):
	$ItemList.clear()
	
	for item in lista:
		var preco = item.get("preco", 0)
		
		var texto = item["nome"]
		if preco > 0:
			texto += "\nR$" + str(preco)
		
		var index = $ItemList.add_item(
			texto,
			item.get("icone", null)
		)
		
		$ItemList.set_item_metadata(index, item)

var menu_aberto = ""

func _on_button_comer_pressed():
	$aviso.avisar("testando 2 comida")
	if menu_aberto == "comida":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.comidas)
		menu_aberto = "comida"
		$ItemList.set_visible(true)


func _on_button_beber_pressed():
	if menu_aberto == "bebida":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.bebidas)
		$ItemList.set_visible(true)
		menu_aberto = "bebida"



func _on_item_list_item_selected(index: int) -> void:
	var item = $ItemList.get_item_metadata(index)
	print(item)
	$ItemList.clear()
	$ItemList.set_visible(false)
	menu_aberto = ""


func _on_button_estudar_pressed() -> void:
	if menu_aberto == "estudar":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.estudar)
		$ItemList.set_visible(true)
		menu_aberto = "estudar"


func _on_button_dormir_pressed() -> void:
	if menu_aberto == "dormir":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.dormir)
		$ItemList.set_visible(true)
		menu_aberto = "dormir"


func _on_button_trabalhar_pressed() -> void:
	if menu_aberto == "trabalhar":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		$ItemList.clear()
	
		for item in itens.trabalhar:
			var req = item.get("req_estudo", 0.0)
			if estudo_level < req:
				continue
			var texto = item["nome"]
			if item.has("salario"):
				texto += "\nGanhos" + str(item["salario"])
			elif item.has("salario_mult"):
				texto += "\n$ variável"
			var index = $ItemList.add_item(
				texto,
				item.get("icone", null)
			)
			$ItemList.set_item_metadata(index, item)
		$ItemList.set_visible(true)
		menu_aberto = "trabalhar"


func _on_button_socializar_pressed() -> void:
	if menu_aberto == "socializar":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.socializar)
		$ItemList.set_visible(true)
		menu_aberto = "socializar"


func _on_button_diver_pressed() -> void:
	if menu_aberto == "diversao":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.diversao)
		$ItemList.set_visible(true)
		menu_aberto = "diversao"


func _on_button_investir_pressed() -> void:
	if menu_aberto == "investir":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.investir)
		$ItemList.set_visible(true)
		menu_aberto = "investir"


func _on_button_aula_pressed() -> void:
	if menu_aberto == "aula":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.aula)
		$ItemList.set_visible(true)
		menu_aberto = "aula"
