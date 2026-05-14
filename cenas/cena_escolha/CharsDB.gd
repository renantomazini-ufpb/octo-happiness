extends Node

@export var personagens = [
	{
		"nome":"Aline",
		"icone":preload("res://icon.svg"),
		"curso":"Psicologia",
		"descricao":"Curso de Psicologia permite maior sociabilidade e menos estresse, porém reduz energia diária.",
		"cena":preload("res://cenas/atores/aline.tscn")
	},
	{
		"nome":"Carina",
		"icone":preload("res://icon.svg"),
		"curso":"Letras",
		"descricao":"Curso de Letras aumenta social por dia, mas paga menos no começo.",
		"cena":preload("res://cenas/atores/carina.tscn")
	},
	{
		"nome":"Diego",
		"icone":preload("res://icon.svg"),
		"curso":"Matemática",
		"descricao":"Curso de Matemática tem maior tempo de duração pela reprovação, mas ganha ligeramente a mais.",
		"cena":preload("res://cenas/atores/diego.tscn")
	},
	{
		"nome":"Fernanda",
		"icone":preload("res://icon.svg"),
		"curso":"Engenharia",
		"descricao":"Curso de Engenharia tem maior tempo de duração pela reprovação, mas com menos sociabilidade.",
		"cena":preload("res://cenas/atores/fernanda.tscn")
	},
	{
		"nome":"Luna",
		"icone":preload("res://icon.svg"),
		"curso":"Biologia",
		"descricao":"Curso de Biologia reduz estresse e melhora recuperação de energia. Estudante com TDAH, estudo rende menos,mas a diversão sobe mais rápido.",
		"cena":preload("res://cenas/atores/luna.tscn")
	},
	{
		"nome":"Pedro",
		"icone":preload("res://icon.svg"),
		"curso":"Medicina",
		"descricao":"Curso de Medicina tem maior cansaço, consumindo energia e fome maior, paga ligeramente mais",
		"cena":preload("res://cenas/atores/pedro.tscn")
	},
	{
		"nome":"Ronan",
		"icone":preload("res://icon.svg"),
		"curso":"Computação",
		"descricao":"Curso de Computação paga ligeramente mais, porém diversão maior. Estudante TEA, sociabilidade cai menos, porém diversão cai mais.",
		"cena":preload("res://cenas/atores/ronan.tscn")
	}
]
