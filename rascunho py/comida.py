class comida:
    def __init__(self, nome, cal, tipo, preco):
        self.nome = nome
        self.cal = cal
        self.tipo = tipo
        self.preco = preco


bolo = comida("Bolo", 30, "doce", 8)
chocolate = comida("Chocolate", 15, "doce", 6)

pastel = comida("Pastel", 25, "salgado", 8)
empada = comida("Empada", 20, "salgado", 7)
pao_de_queijo = comida("Pão de queijo", 15, "salgado", 5)

marmita = comida("Marmita", 45, "almoço", 12)
bento = comida("Bento", 50, "almoço", 18)
prato_feito = comida("Prato feito", 55, "almoço", 20)

hamburguer = comida("Hambúrguer", 40, "jantar", 18)
batata_frita = comida("Batata frita", 30, "salgado", 10)
combo_fastfood = comida("Combo fast-food", 60, "jantar", 25)

cafe = comida("Café", 5, "doce", 4)
suco = comida("Suco", 10, "doce", 6)