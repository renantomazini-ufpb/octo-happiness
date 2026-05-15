extends Node2D
const ItensDB = preload("res://scripts/ItensDB.gd")
var nome = ''
var curso_nome = ''
var fomev = 60.00
var sedev = 100.00
var calmav = 100.0
var energiav = 100.00
var socialv = 60.00
var level_prof = 1
var estudo_level = 1.0
var curso = 0.0
var dia = 0
var minutos = 720
var travado = false
var criticos = 0

@onready var itens = ItensDB.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var p = Global.personagem
	set_nome(p["nome"])
	set_curso_nome(p["curso"])
	$Quarto1.acao_terminou.connect(_fim_animacao)
	$Money.add_din_first(50.00)
	$fome.set_perc_first_time(fomev)
	$fome.set_nome("FOME")
	$calma.set_perc_first_time(calmav)
	$calma.set_nome("CALMA")
	$energia.set_perc_first_time(energiav)
	$energia.set_nome("ENERGIA")
	$social.set_perc_first_time(socialv)
	$social.set_nome("SOCIAL")
	$sede.set_perc_first_time(sedev)
	$sede.set_nome("SEDE")
	
	
	
	
func leitura_status(): #rodar a cada interação
	var texto = ''
	criticos = 0

	# SEDE
	if sedev > 30:
		$sede.set_nome("SEDE")

	if sedev < 30 and sedev > 10:
		$Quarto1.balao("sede")
		texto += "Começando a ficar com sede\n"
		$sede.set_nome("SEDE!")
	elif sedev <= 10 and sedev > 0:
		texto += "Sede crítica\n"
		$sede.set_nome("SEDE!!")
	elif sedev <= 0:
		texto += "Sedento por água!\n"
		$sede.set_nome("SEDE!!!")
		criticos += 1

	# FOME
	if fomev > 30:
		$fome.set_nome("FOME")

	if fomev < 30 and fomev > 10:
		$Quarto1.balao("exclamacao")
		texto += "Começando a ficar com fome\n"
		$fome.set_nome("FOME!")
	elif fomev <= 10 and fomev > 0:
		texto += "Fome crítica\n"
		$fome.set_nome("FOME!!")
	elif fomev <= 0:
		texto += "Você está voraz!\n"
		$fome.set_nome("FOME!!!")
		criticos += 1

	# ENERGIA
	if energiav > 30:
		$energia.set_nome("ENERGIA")
		
	if energiav < 30 and energiav > 10:
		texto += "Começando a ficar cansado\n"
		$Quarto1.balao("exclamacao")
		$energia.set_nome("ENERGIA!")
	elif energiav <= 10 and energiav > 0:
		texto += "Energia crítica\n"
		$energia.set_nome("ENERGIA!!")
	elif energiav <= 0:
		texto += "Você não aguenta mais!\n"
		$energia.set_nome("ENERGIA!!!")
		criticos += 1

	# CALMA
	if calmav > 40:
		$calma.set_nome("CALMA")

	if calmav > 30 and calmav < 40:
		texto += "Você está ficando estressado\n"
		$calma.set_nome("CALMA!")
	elif calmav >= 1 and calmav < 29:
		$Quarto1.balao("raiva")
		texto += "Estresse crítico\n"
		$calma.set_nome("CALMA!!")
	elif calmav <= 0:
		texto += "Você está à beira do burnout!\n"
		$calma.set_nome("CALMA!!!")
		criticos += 1

	# SOCIAL
	if socialv > 30:
		$social.set_nome("SOCIAL")

	if socialv < 30 and socialv > 10:
		texto += "Sentindo falta de interação social\n"
		$Quarto1.balao("outro")
		$social.set_nome("SOCIAL!")
	elif socialv <= 10 and socialv > 0:
		texto += "Social crítico\n"
		$social.set_nome("SOCIAL!!")
	elif socialv <= 0:
		texto += "Você PRECISA ver gente\n"
		$social.set_nome("SOCIAL!!!")
		criticos += 1

	return texto
	
	
func add_fome(valor):
	valor = valor * Global.mult_fomev
	fomev = fomev + valor
	$fome.set_perc(fomev)
	
func add_calma(valor):
	valor = valor * Global.mult_calmav
	if nome == "Ronan" and menu_aberto == "socializar":
			valor = valor * -1
	if nome == "Ronan" and menu_aberto == "diversao":
		valor = valor * 1.3
	calmav = calmav + valor
	$calma.set_perc(calmav)
	
func add_energia(valor):
	valor = valor * Global.mult_energiav
	if nome == "Ronan" and menu_aberto == "trabalhar":
		valor = valor * 1.3
	energiav = energiav + valor
	$energia.set_perc(energiav)
	
func add_social(valor):
	valor = valor * Global.mult_socialv
	if nome == "Ronan" and menu_aberto == "socializar":
		valor = valor * 1.5
	socialv = socialv + valor
	$social.set_perc(socialv)
	
func add_sede(valor):
	valor = valor * Global.mult_sedev
	sedev = sedev + valor
	$sede.set_perc(sedev)
	
	
func set_nome(nomestr):
	nome = nomestr
	$nome_sobrenome.text = nome
	
func set_curso_nome(curso_nomestr):
	curso_nome = curso_nomestr
	$curso.text = curso_nome
	if curso_nomestr == "Letras":
		Global.mult_energiav = 1.4
		Global.mult_fomev = 0.8
		Global.mult_sal = 0.9
		Global.mult_calmav = 1.2
	if curso_nomestr == "Psicologia":
		Global.mult_socialv = 1.4
		Global.mult_energiav = 0.8
		Global.mult_calmav = 1.2
	if curso_nomestr == "Matemática":
		Global.mult_energiav = 0.9
		Global.mult_sal = 1.4
		Global.mult_calmav = 0.9
	if curso_nomestr == "Engenharia":
		Global.mult_energiav = 1.5
		Global.mult_sal = 1.3
		Global.mult_fomev = 0.9
		Global.mult_sedev = 0.9
	if curso_nomestr == "Biologia":
		Global.mult_energiav = 1.2
		Global.mult_socialv = 1.2
		Global.mult_tempo = 0.8
	if curso_nomestr == "Medicina":
		Global.mult_energiav = 0.8
		Global.mult_socialv = 1.2
		Global.mult_tempo = 1.2
		Global.mult_fomev = 0.8
		Global.mult_sedev = 0.8
		Global.mult_calmav = 0.9
		Global.mult_sal = 2.0		
	if curso_nomestr == "Computação":
		Global.mult_energiav = 0.9
		Global.mult_calmav = 0.9
	if curso_nomestr ==	"Sistemas de Informação":
		Global.mult_socialv = 1.2
		Global.mult_calmav = 0.9

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
		add_money(dinheiro_pais)
		minutos -= 1440
		dia += 1
		$dia.text = str(dia)
		$aviso.avisar("O dia passou, seus pais enviaram \n R$" + str("%0.2f" % dinheiro_pais) +
		"\n dia: " +str(dia))
		print(leitura_status()) # botar em um label
	var hora = int(minutos / 60)
	var minute = minutos % 60

	var str_min = str(minute).pad_zeros(2)
	$hora_label.text = str(hora) + ":" + str_min
	

	
func game_over():
	if criticos >= 3:
		print("fim de jogo") # colocar mudança de tela e mandar o leitura de status
	if $Money.passar_dia():
		print("fim de jogo por dinheiro devido")


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
			tooltip += "Fome: +" + str(item["fome"] * Global.mult_fomev) + "\n"

		if item.has("sede"):
			tooltip += "Sede: +" + str(item["sede"] * Global.mult_sedev) + "\n"

		if item.has("energia"):
			tooltip += "Energia: " + str(item["energia"] * Global.mult_energiav) + "\n"

		if item.has("calma"):
			tooltip += "Calma: " + str(item["calma"] * Global.mult_calmav ) + "\n"

		if item.has("social"):
			tooltip += "Social: +" + str(item["social"] * Global.mult_socialv ) + "\n"

		if item.has("tempo"):
			tooltip += "Tempo: " + str(item["tempo"] * Global.mult_tempo) + " min\n"

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
	if item.has("fome"):
		add_fome(item["fome"])
	if item.has("sede"):
		add_sede(item["sede"])
	if item.has("energia"):
		add_energia(item["energia"])
	if item.has("calma"):
		add_calma(item["calma"])
	if item.has("social"):
		add_social(item["social"])
	if item.has("salario"):
		add_money(item["salario"])
	if item.has("salario_mult"):
		add_money(estudo_level * item["salario_mult"])
	if item.has("estudo"):
		estudo_level += item["estudo"]
	$Quarto1.acao_terminou.connect(_fim_animacao)
	if item.has("preco"):
		add_money(-item["preco"])
	if item.has("tempo"):
		passar_tempo(item["tempo"])
	else:
		passar_tempo(10)
	if item.has("bonus"):
		var ganho = (estudo_level / 4.0) * item["bonus"]
		curso += ganho
		curso_perc_update(curso)
	#animacoes
	if menu_aberto == "comidas":
		await $Quarto1.comer()
	elif menu_aberto == "bebidas":
		$Quarto1.balao("sede")
		await $Quarto1.beber()
	elif menu_aberto == "estudar":
		await $Quarto1.estudar()
	elif menu_aberto == "dormir":
		await $Quarto1.dormir()
	elif menu_aberto == "trabalhar":
		$Quarto1.balao("dinheiro")
		await $Quarto1.sair_casa()
	elif menu_aberto == "aula":
		$Quarto1.balao("exclamacao")
		if item["nome"] == "Assistir aula online" or item["nome"] == "Assistir gravado":
			await $Quarto1.estudar()
		else:
			await $Quarto1.sair_casa()
	elif menu_aberto == "socializar":
		await $Quarto1.sair_casa()
	elif menu_aberto == "diversao":
		if item["nome"] == "Leitura":
			await $Quarto1.ler()
		elif item["nome"] == "Escutar música":
			$Quarto1.balao("musica")
			await $Quarto1.celular()
		else:
			await $Quarto1.estudar()
	#fechadao
	menu_aberto = ""
	normaliza()
	print(leitura_status())
	
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
	#ele não pode usar o mesmo que os outros por causa da classificação e desbloqueio
	if travado == true: 
		return
	if menu_aberto == "trabalhar":
		$ItemList.clear()
		$ItemList.set_visible(false)
		menu_aberto = ""
	else:
		$ItemList.clear()
		for item in itens.trabalhar:
			var req = item.get("req_estudo", 0.0) #aqui a classificação e desbloqueio
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
		menu_aberto = "trabalhar"
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
	calmav = clamp(calmav, 0, 100)
	energiav = clamp(energiav, 0, 100)
	socialv = clamp(socialv, 0, 100)

	$fome.set_perc(fomev)
	$sede.set_perc(sedev)
	$calma.set_perc(calmav)
	$energia.set_perc(energiav)
	$social.set_perc(socialv)


func _fim_animacao():
	#print("acabou")
	desbloquear()
