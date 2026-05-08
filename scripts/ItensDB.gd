@export var comidas = [
	{"nome":"Ovo frito","icone":preload("res://icon.svg"),"preco":0.5,"fome":4,"energia":4},
	{"nome":"Pão com manteiga","icone":preload("res://icon.svg"),"preco":0.9,"fome":6,"energia":5},
	{"nome":"Miojo","icone":preload("res://icon.svg"),"preco":2.5,"fome":30,"energia":-10,"estresse":10},
	{"nome":"Sanduíche","icone":preload("res://icon.svg"),"preco":3.0,"fome":25,"energia":10},
	{"nome":"Coxinha","icone":preload("res://icon.svg"),"preco":3.0,"fome":20,"energia":10,"estresse":-10},
	{"nome":"Doce de leite","icone":preload("res://icon.svg"),"preco":5.0,"fome":15,"energia":10,"estresse":-20},
	{"nome":"Fatia de bolo","icone":preload("res://icon.svg"),"preco":5.0,"fome":20,"energia":5,"estresse":-20},
	{"nome":"Almoço simples","icone":preload("res://icon.svg"),"preco":10.0,"fome":30,"energia":20,"estresse":-20},
	{"nome":"Almoço com proteína","icone":preload("res://icon.svg"),"preco":15.0,"fome":55,"energia":10,"estresse":-20},
	{"nome":"Parmegiana","icone":preload("res://icon.svg"),"preco":15.0,"fome":40,"energia":20,"estresse":-25},
	{"nome":"Pizza","icone":preload("res://icon.svg"),"preco":20.0,"fome":75,"energia":10,"estresse":-30},
	{"nome":"Sushi","icone":preload("res://icon.svg"),"preco":30.0,"fome":75,"energia":20,"estresse":-50}
]

@export var bebidas = [
	{"nome":"Água","icone":preload("res://icon.svg"),"preco":0.5,"sede":50},
	{"nome":"Suco Tang","icone":preload("res://icon.svg"),"preco":1.0,"sede":30,"estresse":-10},
	{"nome":"Café","icone":preload("res://icon.svg"),"preco":3.0,"sede":30,"estresse":-5,"energia":30},
	{"nome":"Refri simples","icone":preload("res://icon.svg"),"preco":3.0,"sede":20,"estresse":-15,"energia":0},
	{"nome":"Refri bom","icone":preload("res://icon.svg"),"preco":5.0,"sede":20,"estresse":-30,"energia":10},
	{"nome":"Monster","icone":preload("res://icon.svg"),"preco":10.0,"sede":10,"estresse":-20,"energia":75},
	{"nome":"Redbull","icone":preload("res://icon.svg"),"preco":9.0,"sede":10,"estresse":-10,"energia":50},
	{"nome":"Vinho","icone":preload("res://icon.svg"),"preco":15.0,"sede":50,"estresse":-75,"energia":-30}
]

@export var estudar = [
	{"nome":"Teste","estudo":1,"estresse":10,"energia":-25,"tempo":4,"icone":preload("res://icon.svg")},
	{"nome":"Ler PDFs","estudo":0.1,"estresse":10,"energia":-25,"tempo":30,"icone":preload("res://icon.svg")},
	{"nome":"Ver vídeos","estudo":0.1,"estresse":15,"energia":-20,"tempo":30,"icone":preload("res://icon.svg")},
	{"nome":"Criar resumos","estudo":0.2,"estresse":25,"energia":-20,"tempo":30,"icone":preload("res://icon.svg")},
	{"nome":"Criar apresentação","estudo":0.2,"estresse":35,"energia":-10,"tempo":30,"icone":preload("res://icon.svg")},
	{"nome":"Ler livro","preco":25.0,"estudo":0.75,"estresse":10,"energia":-5,"tempo":30,"icone":preload("res://icon.svg")},
	{"nome":"Ler artigos","estudo":0.2,"estresse":35,"energia":-10,"tempo":20,"icone":preload("res://icon.svg")}
]

@export var dormir = [
	{"nome":"Cochilar","estresse":-20,"energia":20,"tempo":30,"icone":preload("res://icon.svg")},
	{"nome":"Dormidinha","estresse":-30,"energia":30,"tempo":120,"icone":preload("res://icon.svg")},
	{"nome":"Dormir meia","estresse":-30,"energia":45,"tempo":240,"icone":preload("res://icon.svg")},
	{"nome":"Dormir completo","estresse":-50,"energia":80,"tempo":420,"icone":preload("res://icon.svg")}
]

@export var trabalhar = [
	{"nome":"iFood bike","salario":3.0,"tempo":60,"estresse":50,"req_estudo":0.0,"icone":preload("res://icon.svg")},
	{"nome":"Freelancer","salario":5.0,"tempo":30,"estresse":20,"req_estudo":1.5,"icone":preload("res://icon.svg")},
	{"nome":"Tradução","salario":5.0,"tempo":20,"estresse":30,"req_estudo":2.5,"icone":preload("res://icon.svg")},
	{"nome":"Bolo de pote","salario":6.0,"tempo":30,"estresse":30,"req_estudo":2.5,"icone":preload("res://icon.svg")},
	{"nome":"Empreender","salario":5.0,"tempo":30,"estresse":25,"req_estudo":3.5,"icone":preload("res://icon.svg")},
	{"nome":"Projeto pessoal","salario_mult":10,"tempo":60,"estresse":50,"req_estudo":4.0,"icone":preload("res://icon.svg")},
	{"nome":"Mercado","salario":6.0,"tempo":60,"estresse":70,"req_estudo":2.0,"icone":preload("res://icon.svg")},
	{"nome":"Estágio","salario":7.5,"tempo":60,"estresse":50,"req_estudo":3.0,"icone":preload("res://icon.svg")},
	{"nome":"Freelancer exterior","salario":10.0,"tempo":60,"estresse":70,"req_estudo":5.0,"icone":preload("res://icon.svg")},
	{"nome":"CLT básico","salario":13.0,"tempo":120,"estresse":40,"req_estudo":5.5,"icone":preload("res://icon.svg")},
	{"nome":"Dar aula","salario":18.0,"tempo":60,"estresse":50,"req_estudo":7.5,"icone":preload("res://icon.svg")},
	{"nome":"Ajudar colegas","salario":21.0,"tempo":60,"estresse":50,"req_estudo":8.0,"icone":preload("res://icon.svg")},
	{"nome":"CLT avançado","salario":34.0,"tempo":60,"estresse":30,"req_estudo":10.0,"icone":preload("res://icon.svg")}
]

@export var socializar = [
	{"nome":"Conversar online","tempo":30,"estresse":-10,"social":10,"icone":preload("res://icon.svg")},
	{"nome":"Sair com amigos","preco":10.0,"tempo":60,"estresse":-20,"social":25,"icone":preload("res://icon.svg")},
	{"nome":"Festa","preco":25.0,"tempo":120,"estresse":-30,"social":40,"energia":-20,"icone":preload("res://icon.svg")}
]

@export var diversao = [
	{"nome":"Leitura","tempo":30,"estresse":-10,"energia":-5,"icone":preload("res://icon.svg")},
	{"nome":"Ver filme","preco":5.0,"tempo":90,"estresse":-20,"energia":-10,"icone":preload("res://icon.svg")},
	{"nome":"Escutar música","tempo":30,"estresse":-15,"icone":preload("res://icon.svg")},
	{"nome":"Andar de bike","tempo":60,"estresse":-20,"energia":-15,"icone":preload("res://icon.svg")},
	{"nome":"Desenhar","tempo":60,"estresse":-25,"energia":-10,"icone":preload("res://icon.svg")},
	{"nome":"Jogar videogame","tempo":90,"estresse":-30,"energia":-15,"icone":preload("res://icon.svg")}
]

@export var investir = [
	{"nome":"Poupança","valor_min":10.0,"retorno":0.02,"risco":0.0,"tempo":0,"icone":preload("res://icon.svg")},
	{"nome":"Ações seguras","valor_min":20.0,"retorno":0.05,"risco":0.1,"tempo":0,"icone":preload("res://icon.svg")},
	{"nome":"Ações arriscadas","valor_min":10.0,"retorno":0.15,"risco":0.4,"tempo":0,"icone":preload("res://icon.svg")},
	{"nome":"Criptoativos","valor_min":30.0,"retorno":0.75,"risco":0.9,"tempo":0,"icone":preload("res://icon.svg")},
	{"nome":"Investir em amigo","valor_min":40.0,"retorno":1.5,"risco":0.8,"tempo":0,"icone":preload("res://icon.svg")}
	
	
]

@export var aula = [
	{"nome":"Assistir aula presencial","preco":5.0,"tempo":60,"estresse":15,"energia":-20,"social":10,"bonus":1.0,"icone":preload("res://icon.svg")},
	{"nome":"Assistir aula online","preco":2.0,"tempo":60,"estresse":10,"energia":-15,"social":5,"bonus":0.6,"icone":preload("res://icon.svg")},
	{"nome":"Assistir gravado","tempo":60,"estresse":5,"energia":-10,"social":0,"bonus":0.4,"icone":preload("res://icon.svg")}
]
