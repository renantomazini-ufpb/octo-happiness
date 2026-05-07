extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	usando_pc()
	if self.frame == 5:
		self.set_position(Vector2(50.00,32.0))
		andando_direita()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(self.frame)

func andando_costas():
	self.play("Andando_costas")

func andando_direita():
	self.play("Andando_direita")

func andando_esquerda():
	self.play("Andando_esquerda")

func andando_frente():
	self.play("Andando_frente")


func estica_braco():
	self.play("Estica_braco")


func lendo():
	self.play("Lendo")


func respirando_costas():
	self.play("Respirando_costas")

func respirando_direita():
	self.play("Respirando_direita")

func respirando_esquerda():
	self.play("Respirando_esquerda")

func respirando_frente():
	self.play("Respirando_frente")


func sentado_direita():
	self.play("Sentado_direita")

func sentado_esquerda():
	self.play("Sentado_esquerda")


func usando_celular():
	self.play("Usando_celular")

func usando_pc():
	self.set_position(Vector2(184.00,32.0))
	self.play("Usando_pc")
