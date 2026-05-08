extends Node2D
'''
Geladeira 40,64
estante 208,32
computador 184,32
cama 232,64
pia 80, 32
micro 48,32
neutro 112,64
porta 136, 16
'''

var locais = {
	"geladeira": Vector2(40,56),
	"pia": Vector2(80,56),
	"cama": Vector2(232,64),
	"computador": Vector2(184,56),
	"estante": Vector2(208,56),
	"micro": Vector2(48,32),
	"neutro": Vector2(112,64),
	"porta": Vector2(136,24)
}



func ir_para(local):

	var alvo = locais[local]

	while $Personagem.position.distance_to(alvo) > 1:
		$TimerC.start()

		# horizontal
		if $Personagem.position.x > alvo.x:
			$Personagem.andando_esquerda()
			$Personagem.position.x -= 8

		elif $Personagem.position.x < alvo.x:
			$Personagem.andando_direita()
			$Personagem.position.x += 8

		# vertical
		elif $Personagem.position.y < alvo.y:
			$Personagem.andando_frente()
			$Personagem.position.y += 8

		elif $Personagem.position.y > alvo.y:
			$Personagem.andando_costas()
			$Personagem.position.y -= 8

		await $TimerC.timeout
	$Personagem.position = alvo
		
		
func idle():
	$Personagem.respirando_frente()
	
	
func comer():
	await ir_para("geladeira")
	$Personagem.estica_braco()
	$Geladeira.play("abrir")
	await get_tree().create_timer(2).timeout
	$Geladeira.play("fechar")
	await ir_para("micro")
	$Personagem.comer_animation()
	await get_tree().create_timer(5).timeout
	$Personagem.respirando_frente()

func beber():
	await ir_para("geladeira")
	$Personagem.estica_braco()
	$Geladeira.play("abrir")
	await get_tree().create_timer(3).timeout
	$Geladeira.play("fechar")
	$Personagem.comer_animation()
	await get_tree().create_timer(5).timeout
	$Geladeira.play("fechar")
	$Personagem.respirando_frente()
	

func estudar():
	await ir_para("computador")
	$Personagem.usando_pc()
	$Mesa_estudo/Computer.play("funcionando")
	await get_tree().create_timer(5).timeout
	$Mesa_estudo/Computer.play("desligado")
	$Mesa_estudo/Computer.pause()
	await ir_para("neutro")
	$Personagem.respirando_frente()
	
	
func dormir():
	await ir_para("cama")
	$Personagem.respirando_esquerda()
	await get_tree().create_timer(5).timeout
	await ir_para("neutro")
	$Personagem.respirando_frente()
	
func sair_casa():
	await ir_para("porta")
	$PortaBanheiro.play("default")
	$Personagem.visible = false
	await get_tree().create_timer(4).timeout
	$PortaBanheiro.play("default")
	$Personagem.visible = true
	await ir_para("neutro")
	$Personagem.respirando_frente()

func ler():
	$Personagem.lendo()
	await get_tree().create_timer(3).timeout
	$Personagem.respirando_frente()
	
func celular():
	$Personagem.usando_celular()
	await get_tree().create_timer(3).timeout
	$Personagem.respirando_frente()
