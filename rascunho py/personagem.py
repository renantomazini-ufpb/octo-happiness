import random

class personagem:
    def __init__(self, nome, tipo, curso):
        self.nome = nome
        self.tipo = tipo 
        self.curso = curso
        self.fome = 100
        self.estresse = 100
        self.sono = 100
        self.conclusao = 0
        self.social = 100
        self.dinheiro = 0.00
        self.status =  'ok'

def obterStatus(self):
    status_list = []
    #  NECESSIDADES BÁSICAS 
    if self.fome < 30:
        status_list.append("faminto")
    elif self.fome < 60:
        status_list.append("com fome")

    if self.sono < 30:
        status_list.append("exausto")
    elif self.sono < 60:
        status_list.append("com sono")

    if self.social < 10:
        status_list.append("isolado")
    elif self.social < 40:
        status_list.append("precisando socializar")

    # ESTRESSE (invertido) 
    if self.estresse < 20:
        status_list.append("em pânico")
    elif self.estresse < 40:
        status_list.append("estressado")
    elif self.estresse < 60:
        status_list.append("tenso")

    # (AUTISMO) 
    if self.tipo != 1:
        # social alto + estresse alto (estresse alto = valor alto = calmo)
        if self.social > 70 and self.estresse > 70:
            status_list.append("meltdown")
        # social alto + estresse baixo (muito estressado)
        if self.social > 70 and self.estresse < 30:
            status_list.append("shutdown")

    # STATUS GERAL 
    if not status_list:
        status_list.append("ok")
    self.status = ", ".join(status_list)

    
    def comer(self,cal,comida):
        self.fome = self.fome + cal
        if self.tipo != 1:
            self.estresse += cal/2
        if comida == 'doce':
            self.estresse += 25
            self.sono += 15
        if comida == 'almoço':
            self.sono -= 15
        if comida == 'jantar':
            self.sono -= 10
        if comida == 'salgado':
            self.sono -= 10
            self.estresse += 5
    
    def beber_cafe(self):
        self.fome =  self.fome + 5
        self.estresse = self.estresse + 3
        self.sono = self.sono + 5
    
    def dormir(self,tempo):
        self.sono =  self.sono + (tempo*10)
        self.estresse = self.estresse + (tempo*5)
    
    def estudarSolo(self,tempo):
        self.sono = self.sono - (tempo*8)
        self.conclusao = self.conclusao + random.randint(0,2)
        if self.tipo != 1:
            self.estresse +=  5
        else:
            self.estresse += 20

    def estudarVideoaula(self,tempo):
        self.sono = self.sono - (tempo*5)
        self.conclusao = self.conclusao + random.randint(0,3)
        if self.tipo != 1:
            self.estresse +=  5
            self.social += 10
        else:
            self.estresse += 20

    def estudarPresencial(self,tempo):
        self.sono = self.sono - (tempo*13)
        self.conclusao = self.conclusao + random.randint(1,5)
        if self.tipo != 1:
            self.estresse += 15
            self.social += 10
        else:
            self.social += 30
            self.estresse += 5

    def estudarBiblioteca(self,tempo):
        self.sono = self.sono - (tempo*6)
        self.conclusao = self.conclusao + random.randint(1,3)
        if self.tipo != 1:
            self.estresse += 3
            self.social += 5
        else:
            self.social -= 10
            self.estresse += 15
    
    def terapia(self):
        self.estresse = self.estresse + 40
        if self.tipo != 1:
            self.estresse += self.estresse + 10
            self.social += 10
    
    def antidrepessivo(self):
        self.estresse =  self.estresse + 50
        if self.tipo != 1:
            self.sono += 45

    def trabalhar(self, dinheiro, horas, tipo):
        self.dinheiro += dinheiro
        if tipo == 'subemprego':
            self.estresse -= horas * 4
        if tipo == 'estagio':
            self.estresse -= horas * 3
        if tipo == 'freelancer':
            self.estresse -= horas * 2
        if tipo == 'trabalho':
            self.estresse -= horas * 1
        if self.tipo != 1:
            self.estresse -= 10
            self.social -= 10
            self.sono -= 10
            self.dinheiro += (dinheiro * 0.2 * horas)
        else:
            self.social += 5
            self.sono -= 5

    def receberDinheiroPais(self):
        self.dinheiro += random.randint(30,200)
    

    def bolsaEstudo(self, dinheiro):
        self.dinheiro += dinheiro

    def jogar(self):
        self.estresse += random.randint(20,40)
        self.sono -= 15
        if self.tipo !=1:
            self.social += 20
            self.estresse += 10

    def ler(self):
        self.estresse += random.randint(5,60)
        self.sono -= 20
        if self.tipo !=1:
            self.social += 20
            self.estresse += 10

    def pet(self):
        self.estresse += random.randint(35,50)
        if self.tipo !=1:
            self.social += 25
            self.estresse += 10
            