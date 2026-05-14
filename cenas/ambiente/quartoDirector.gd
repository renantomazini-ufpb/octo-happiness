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
signal acao_terminou
	
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
var personagem_atual = null

func trocar_personagem(caminho_cena):
	var pos_antiga = Vector2(112,64)

	if personagem_atual != null:
		pos_antiga = personagem_atual.position
		personagem_atual.queue_free()
	var nova_cena = load(caminho_cena)
	personagem_atual = nova_cena.instantiate()
	personagem_atual.position = pos_antiga
	add_child(personagem_atual)
	personagem_atual.name = "Personagem"
	
	
func _ready():
	var p = Global.personagem
	var path_actor = "res://cenas/atores/" +p["nome"].to_lower() + ".tscn"
	trocar_personagem(path_actor)
	#colocar para trocar de boneco aqui assim que eu souber como
	#%Personagem.get_scene_instance_load_placeholder("")


func ir_para(local):

	var alvo = locais[local]
	while personagem_atual.position.distance_to(alvo) > 1:
		$TimerC.start()

		# horizontal
		if personagem_atual.position.x > alvo.x:
			personagem_atual.andando_esquerda()
			personagem_atual.position.x -= 8

		elif personagem_atual.position.x < alvo.x:
			personagem_atual.andando_direita()
			personagem_atual.position.x += 8

		# vertical
		elif personagem_atual.position.y < alvo.y:
			personagem_atual.andando_frente()
			personagem_atual.position.y += 8

		elif personagem_atual.position.y > alvo.y:
			personagem_atual.andando_costas()
			personagem_atual.position.y -= 8

		await $TimerC.timeout
	personagem_atual.position = alvo
		
		
func idle():
	personagem_atual.respirando_frente()
	
	
func comer():
	await ir_para("geladeira")
	personagem_atual.estica_braco()
	$Geladeira.play("abrir")
	await get_tree().create_timer(2).timeout
	$Geladeira.play("fechar")
	await ir_para("micro")
	personagem_atual.comer_animation()
	await get_tree().create_timer(5).timeout
	personagem_atual.respirando_frente()
	acao_terminou.emit()

func beber():
	await ir_para("geladeira")
	personagem_atual.estica_braco()
	$Geladeira.play("abrir")
	await get_tree().create_timer(3).timeout
	$Geladeira.play("fechar")
	personagem_atual.comer_animation()
	await get_tree().create_timer(5).timeout
	$Geladeira.play("fechar")
	personagem_atual.respirando_frente()
	acao_terminou.emit()

func estudar():
	await ir_para("computador")
	personagem_atual.usando_pc()
	$Mesa_estudo/Computer.play("funcionando")
	await get_tree().create_timer(5).timeout
	$Mesa_estudo/Computer.play("desligado")
	$Mesa_estudo/Computer.pause()
	await ir_para("neutro")
	personagem_atual.respirando_frente()
	acao_terminou.emit()
	
func dormir():
	await ir_para("cama")
	personagem_atual.respirando_esquerda()
	await get_tree().create_timer(5).timeout
	await ir_para("neutro")
	personagem_atual.respirando_frente()
	acao_terminou.emit()
	
func sair_casa():
	await ir_para("porta")
	$PortaBanheiro.play("default")
	personagem_atual.visible = false
	await get_tree().create_timer(4).timeout
	$PortaBanheiro.play("default")
	personagem_atual.visible = true
	await ir_para("neutro")
	personagem_atual.respirando_frente()
	acao_terminou.emit()
func ler():
	personagem_atual.lendo()
	await get_tree().create_timer(3).timeout
	personagem_atual.respirando_frente()
	acao_terminou.emit()
	
func celular():
	personagem_atual.usando_celular()
	await get_tree().create_timer(3).timeout
	personagem_atual.respirando_frente()
	acao_terminou.emit()
