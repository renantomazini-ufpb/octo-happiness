extends Node2D
'''
Geladeira 40,64
estante 208,32
computador 184,32
cama 136,32
pia 80, 32
micro 48,32
'''

# Called when the node enters the scene tree for the first time.

func comer():
	while $Personagem.position != Vector2(40,56):
		if $Personagem.position[0] > 40:
			$Personagem.andando_direita()
			$Personagem.andando_esquerda()
			$Personagem.position+= Vector2(-8,0)
		else:
			$Personagem.andando_direita()
			$Personagem.position+= Vector2(8,0)
		await $Timer.timeout
		if $Personagem.position[1] < 64:
			$Personagem.andando_frente()
			$Personagem.position+= Vector2(0,8)
		else:
			$Personagem.andando_costas()
			$Personagem.position+= Vector2(0,-8)
		await $Timer.timeout
	$Personagem.estica_braco()
	$Geladeira.play("abrir")
		
		
	
