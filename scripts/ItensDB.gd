@export var comidas = [
	{"nome":"Ovo frito","icone":preload("res://icon.svg"),"preco":0.45,"fome":10,"energia":5},
	{"nome":"Pão com manteiga","icone":preload("res://icon.svg"),"preco":0.9,"fome":20,"energia":10},
	{"nome":"Miojo","icone":preload("res://icon.svg"),"preco":2.5,"fome":30,"energia":-10,"calma":-10},
	{"nome":"Sanduíche","icone":preload("res://icon.svg"),"preco":3.0,"fome":25,"energia":10},
	{"nome":"Coxinha","icone":preload("res://icon.svg"),"preco":3.0,"fome":25,"energia":10,"calma":10},
	{"nome":"Doce de leite","icone":preload("res://icon.svg"),"preco":5.0,"fome":20,"energia":10,"calma":20},
	{"nome":"Fatia de bolo","icone":preload("res://icon.svg"),"preco":5.0,"fome":20,"energia":5,"calma":20},
	{"nome":"Almoço simples","icone":preload("res://icon.svg"),"preco":10.0,"fome":70,"energia":20,"calma":20},
	{"nome":"Almoço com proteína","icone":preload("res://icon.svg"),"preco":14.0,"fome":85,"energia":10,"calma":20},
	{"nome":"Parmegiana","icone":preload("res://icon.svg"),"preco":15.8,"fome":85,"energia":20,"calma":25},
	{"nome":"Pizza","icone":preload("res://icon.svg"),"preco":23.0,"fome":90,"energia":10,"calma":30},
	{"nome":"Sushi","icone":preload("res://icon.svg"),"preco":30.0,"fome":90,"energia":25,"calma":60}
]

@export var bebidas = [
	{"nome":"Copo água","icone":preload("res://icon.svg"),"preco":1.25,"sede":30},
	{"nome":"Garrafinha de água","icone":preload("res://icon.svg"),"preco":2.5,"sede":60},
	{"nome":"Água","icone":preload("res://icon.svg"),"preco":7.5,"sede":90},
	{"nome":"Suco Tang","icone":preload("res://icon.svg"),"preco":1.0,"sede":30,"calma":10},
	{"nome":"Café","icone":preload("res://icon.svg"),"preco":3.0,"sede":30,"calma":-5,"energia":30},
	{"nome":"Refri simples","icone":preload("res://icon.svg"),"preco":3.0,"sede":25,"calma":15,"energia":0},
	{"nome":"Refri bom","icone":preload("res://icon.svg"),"preco":5.0,"sede":25,"calma":30,"energia":10},
	{"nome":"Monster","icone":preload("res://icon.svg"),"preco":14.0,"sede":15,"calma":20,"energia":75},
	{"nome":"Redbull","icone":preload("res://icon.svg"),"preco":9.0,"sede":15,"calma":10,"energia":50},
	{"nome":"Vinho","icone":preload("res://icon.svg"),"preco":15.0,"sede":50,"calma":75,"energia":-30}
]

@export var estudar = [
	{"nome":"Teste","estudo":1,"calma":-10,"energia":-25,"tempo":360,"icone":preload("res://icon.svg")},
	{"nome":"Ler PDFs","estudo":0.1,"calma":-10,"energia":-25,"tempo":30,"icone":preload("res://icon.svg")},
	{"nome":"Ver vídeos","estudo":0.1,"calma":-15,"energia":-20,"tempo":30,"icone":preload("res://icon.svg")},
	{"nome":"Criar resumos","estudo":0.2,"calma":-25,"energia":-20,"tempo":30,"icone":preload("res://icon.svg")},
	{"nome":"Criar apresentação","estudo":0.2,"calma":-35,"energia":-20,"tempo":30,"icone":preload("res://icon.svg")},
	{"nome":"Ler livro","preco":30.0,"estudo":0.85,"calma":-10,"energia":-20,"tempo":30,"icone":preload("res://icon.svg")},
	{"nome":"Ler artigos","estudo":0.2,"calma":-35,"energia":-15,"tempo":20,"icone":preload("res://icon.svg")}
]

@export var dormir = [
	{"nome":"Cochilar","calma":20,"energia":5,"tempo":30,"icone":preload("res://icon.svg")},
	{"nome":"Cochilão","calma":20,"energia":10,"tempo":60,"icone":preload("res://icon.svg")},
	{"nome":"Dormidinha","calma":20,"energia":20,"tempo":120,"icone":preload("res://icon.svg")},
	{"nome":"Dormir meia","calma":20,"energia":40,"tempo":240,"icone":preload("res://icon.svg")},
	{"nome":"Dormir bastante","calma":50,"energia":80,"tempo":420,"icone":preload("res://icon.svg")},
	{"nome":"Dormir completo","calma":60,"energia":100,"tempo":480,"icone":preload("res://icon.svg")}
]

@export var trabalhar = [
	{"nome":"iFood bike","salario":3.0,"tempo":60,"calma":-50,"req_estudo":0.0,"energia": -50,"icone":preload("res://icon.svg")},
	{"nome":"Freelancer","salario":5.0,"tempo":30,"calma":-20,"req_estudo":1.8,"energia": -30,"icone":preload("res://icon.svg")},
	{"nome":"Tradução","salario":5.0,"tempo":20,"calma":-30,"req_estudo":3.0,"energia": -30,"icone":preload("res://icon.svg")},
	{"nome":"Bolo de pote","salario":6.0,"tempo":30,"calma":-30,"req_estudo":2.5,"energia": -30,"icone":preload("res://icon.svg")},
	{"nome":"Empreender","salario":5.0,"tempo":30,"calma":-35,"req_estudo":3.5,"energia": -20,"icone":preload("res://icon.svg")},
	{"nome":"Projeto pessoal","salario_mult":10,"tempo":-60,"calma":50,"req_estudo":4.0,"energia": -30,"icone":preload("res://icon.svg")},
	{"nome":"Mercado","salario":6.0,"tempo":60,"calma":-70,"req_estudo":2.0,"energia": -40,"icone":preload("res://icon.svg")},
	{"nome":"Estágio","salario":7.5,"tempo":60,"calma":-50,"req_estudo":3.5,"energia": -30,"icone":preload("res://icon.svg")},
	{"nome":"Freelancer exterior","salario":10.0,"tempo":-60,"calma":70,"req_estudo":7.0,"energia": -30,"icone":preload("res://icon.svg")},
	{"nome":"CLT básico","salario":13.0,"tempo":120,"calma":-40,"req_estudo":7.5,"energia": -20,"icone":preload("res://icon.svg")},
	{"nome":"Dar aula","salario":18.0,"tempo":60,"calma":-50,"req_estudo":10.5,"energia": -25,"icone":preload("res://icon.svg")},
	{"nome":"Ajudar colegas","salario":21.0,"tempo":60,"calma":-50,"req_estudo":9.0,"energia": -20,"icone":preload("res://icon.svg")},
	{"nome":"CLT avançado","salario":34.0,"tempo":60,"calma":-30,"req_estudo":15.0,"energia": -15,"icone":preload("res://icon.svg")}
]

@export var socializar = [
	{"nome":"Conversar online","tempo":30,"calma":10,"social":20,"icone":preload("res://icon.svg")},
	{"nome":"Sair com amigos","preco":10.0,"tempo":60,"calma":20,"social":30,"icone":preload("res://icon.svg")},
	{"nome":"Festa","preco":25.0,"tempo":120,"calma":30,"social":40,"energia":-20,"icone":preload("res://icon.svg")}
]

@export var diversao = [
	{"nome":"Leitura","tempo":30,"calma":20,"energia":-15,"icone":preload("res://icons/livro.png")},
	{"nome":"Ver filme","preco":5.0,"tempo":90,"calma":25,"energia":-10,"icone":preload("res://icons/filme.png")},
	{"nome":"Escutar música","tempo":30,"calma":25,"icone":preload("res://icons/musica.png")},
	#{"nome":"Andar de bike","tempo":60,"calma":-20,"energia":-15,"icone":preload("res://icon.svg")},
	{"nome":"Jogar videogame","tempo":90,"calma":50,"energia":-15,"icone":preload("res://icons/videogame.png")}
]



@export var aula = [
	{"nome":"Assistir aula presencial","preco":5.5,"tempo":120,"calma":-15,"energia":-25,"social":20,"bonus":1.2,"icone":preload("res://icons/ir_aula.png")},
	{"nome":"Assistir aula online","preco":2.0,"tempo":60,"calma":-10,"energia":-15,"social":5,"bonus":0.6,"icone":preload("res://icons/computer.png")},
	{"nome":"Assistir gravado","tempo":60,"calma":-5,"energia":-10,"social":0,"bonus":0.4,"icone":preload("res://icons/computer3.png")}
]
