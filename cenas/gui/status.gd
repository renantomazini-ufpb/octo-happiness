extends Node2D
const ItensDB = preload("res://scripts/ItensDB.gd")
var nome = ''
var curso_nome = ''
var fomev = 50.00
var sedev = 100.00
var estressev = 0.0
var energiav = 100.00
var socialv = 50.00
var level_prof = 1
var estudo_level = 1.0
var curso = 0.0
var dia = 0
var minutos = 720
var travado = false
@onready var itens = ItensDB.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var p = Global.personagem

	set_nome(p["nome"])
	set_curso_nome(p["curso"])
	$Quarto1.acao_terminou.connect(_fim_animacao)
	$Money.add_din(50.00)
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
	
	
func add_fome(valor):
	fomev = fomev + valor
	$fome.set_perc(fomev)
	
func add_estresse(valor):
	estressev = estressev + valor
	$estresse.set_perc(estressev)
	
func add_energia(valor):
	energiav = energiav + valor
	$energia.set_perc(energiav)
	
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
	
func curso_perc_update(curso):
	$conclusao_curso_perc.value = curso
	
func add_curso_perc(valor):
	curso = curso + valor
	curso_perc_update(curso)
	
func add_money(valor):
	$Money.add_din(valor)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

#abaixo apenas um teste 
#func _on_timer_timeout() -> void:
#	passar_tempo(10)
	#print("contou")
	#minutos += 10
	#controle_horario(minutos)
	#add_fome(-2)
	#$estresse.set_perc($estresse.get_perc() + 1.5)
	#$Money.set_din(($Money.get_din()).to_float() + 1.12)
	#$Timer.play()


func passar_tempo(qtd):
	minutos += qtd
	add_fome(-qtd * 0.05)
	add_sede(-qtd * 0.1)
	add_energia(-qtd * 0.02)
	controle_horario()
	normaliza()
	
func controle_horario():
	
	while minutos >= 1440:
		var dinheiro_pais = randf_range(10.00, 50.00)
		$aviso.avisar("O dia passou, seus pais enviaram \n R$" + str("%0.2f" % dinheiro_pais) )
		add_money(dinheiro_pais)
		minutos -= 1440
		dia += 1
		
		$dia.text = str(dia)

	var hora = int(minutos / 60)
	var minute = minutos % 60

	var str_min = str(minute).pad_zeros(2)
	$hora_label.text = str(hora) + ":" + str_min
	


func _on_botoes_comer_menu() -> void:
	print("rodou?")
	add_fome(100)


func _on_button_3_pressed() -> void:
	$Money.set_din(3100.21)


func carregar_lista(lista):

	$ItemList.clear()

	for item in lista:

		var texto = item["nome"]
		var preco = item.get("preco", null)
		if preco != null:
			texto += "\nR$" + str("%0.2f" % preco)
		
		var index = $ItemList.add_item(
			texto,
			item.get("icone", null)
		)

		$ItemList.set_item_metadata(index, item)

		var tooltip = ""

		if item.has("preco"):
			tooltip += "Preço: R$" + str(item["preco"]) + "\n"

		if item.has("fome"):
			tooltip += "Fome: +" + str(item["fome"]) + "\n"

		if item.has("sede"):
			tooltip += "Sede: +" + str(item["sede"]) + "\n"

		if item.has("energia"):
			tooltip += "Energia: " + str(item["energia"]) + "\n"

		if item.has("estresse"):
			tooltip += "Estresse: " + str(item["estresse"]) + "\n"

		if item.has("social"):
			tooltip += "Social: +" + str(item["social"]) + "\n"

		if item.has("tempo"):
			tooltip += "Tempo: " + str(item["tempo"]) + " min\n"

		$ItemList.set_item_tooltip(index, tooltip)
		
		

func bloquear():
	travado = true
	
func desbloquear():
	travado = false



func _on_item_list_item_selected(index: int) -> void:
	bloquear()
	var item = $ItemList.get_item_metadata(index)
	print(item)
	$ItemList.clear()
	$ItemList.set_visible(false)
	#animacoes
	if menu_aberto == "comidas":
		await $Quarto1.comer()
	elif menu_aberto == "bebidas":
		await $Quarto1.beber()
	elif menu_aberto == "estudar":
		await $Quarto1.estudar()
	elif menu_aberto == "dormir":
		await $Quarto1.dormir()
	elif menu_aberto == "trabalhar":
		await $Quarto1.sair_casa()
	elif menu_aberto == "aula":
		await $Quarto1.sair_casa()
	elif menu_aberto == "diversao":
		if item["nome"] == "Leitura":
			await $Quarto1.ler()
		elif item["nome"] == "Escutar música":
			await $Quarto1.celular()
		else:
			await $Quarto1.estudar()
	if item.has("fome"):
		add_fome(item["fome"])
	if item.has("sede"):
		add_sede(item["sede"])
	if item.has("energia"):
		add_energia(item["energia"])
	if item.has("estresse"):
		add_estresse(item["estresse"])
	if item.has("social"):
		add_social(item["social"])
	if item.has("preco"):
		add_money(-item["preco"])
	if item.has("salario"):
		add_money(item["salario"])
	if item.has("salario_mult"):
		add_money(estudo_level * item["salario_mult"])
	if item.has("estudo"):
		estudo_level += item["estudo"]
	if item.has("tempo"):
		passar_tempo(item["tempo"])
	else:
		passar_tempo(10)
	if item.has("bonus"):
		var ganho = (estudo_level / 4.0) * item["bonus"]
		curso += ganho
		curso_perc_update(curso)
	#fechadao
	menu_aberto = ""
	normaliza()
	
var menu_aberto = ""

func abrir_menu(nome_menu):
	if travado == true:
		return
	if menu_aberto == nome_menu:
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.get(nome_menu))
		menu_aberto = nome_menu
		$ItemList.set_visible(true)

func _on_button_comer_pressed():
	abrir_menu("comidas")
	#$aviso.avisar("testando 2 comida")
	#$Quarto1.comer()
	'''if menu_aberto == "comida":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.comidas)
		menu_aberto = "comida"
		$ItemList.set_visible(true)'''


func _on_button_beber_pressed():
	abrir_menu("bebidas")
	'''if menu_aberto == "bebida":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.bebidas)
		$ItemList.set_visible(true)
		menu_aberto = "bebida"'''


func _on_button_estudar_pressed() -> void:
	abrir_menu("estudar")
	'''if menu_aberto == "estudar":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.estudar)
		$ItemList.set_visible(true)
		menu_aberto = "estudar"'''


func _on_button_dormir_pressed() -> void:
	abrir_menu("dormir")
	'''if menu_aberto == "dormir":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.dormir)
		$ItemList.set_visible(true)
		menu_aberto = "dormir"'''


func _on_button_trabalhar_pressed() -> void:
	abrir_menu("trabalhar")
	'''if menu_aberto == "trabalhar":
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
				texto += "\nGanhos " + str(item["salario"])
			elif item.has("salario_mult"):
				texto += "\n$ variável"
			var index = $ItemList.add_item(
				texto,
				item.get("icone", null)
			)
			$ItemList.set_item_metadata(index, item)
		$ItemList.set_visible(true)
		menu_aberto = "trabalhar"'''


func _on_button_socializar_pressed() -> void:
	abrir_menu("socializar")
	'''if menu_aberto == "socializar":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.socializar)
		$ItemList.set_visible(true)
		menu_aberto = "socializar"'''


func _on_button_diver_pressed() -> void:
	abrir_menu("diversao")
	'''if menu_aberto == "diversao":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.diversao)
		$ItemList.set_visible(true)
		menu_aberto = "diversao"'''


func _on_button_investir_pressed() -> void:
	abrir_menu("investir")
	'''if menu_aberto == "investir":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.investir)
		$ItemList.set_visible(true)
		menu_aberto = "investir"'''


func _on_button_aula_pressed() -> void:
	abrir_menu("aula")
	'''if menu_aberto == "aula":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		carregar_lista(itens.aula)
		$ItemList.set_visible(true)
		menu_aberto = "aula"'''
		
		
		
func normaliza():
	fomev = clamp(fomev, 0, 100)
	sedev = clamp(sedev, 0, 100)
	estressev = clamp(estressev, 0, 100)
	energiav = clamp(energiav, 0, 100)
	socialv = clamp(socialv, 0, 100)

	$fome.set_perc(fomev)
	$sede.set_perc(sedev)
	$estresse.set_perc(estressev)
	$energia.set_perc(energiav)
	$social.set_perc(socialv)


func _fim_animacao():
	#print("acabou")
	desbloquear()
