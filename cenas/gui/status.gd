extends Node2D
var nome = ''
var curso_nome = ''
var fomev = 33.00
var sedev = 100.00
var estressev = 0.0
var energiav = 100.00
var socialv = 50.00
var money = 0.0
var level_prof = 1
var curso = 0
var dia = 0
var minutos = 720


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
	
func add_fome(valor):
	fomev = fomev + valor
	$fome.set_perc(fomev)
	
func add_estresse(valor):
	estressev = estressev + valor
	$fome.set_perc(estressev)
	
func add_energia(valor):
	energiav = energiav + valor
	$fome.set_perc(energiav)
	
func add_social(valor):
	socialv = socialv + valor
	$fome.set_perc(socialv)
	
func add_sede(valor):
	sedev = sedev + valor
	$fome.set_perc(sedev)
	
	
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
