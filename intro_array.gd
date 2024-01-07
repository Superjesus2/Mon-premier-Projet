extends Node2D

@export var palette: Array[Color]

# Called when the node enters the scene tree for the first time.
func _ready():
	var icons = $%icon_container.get_children()
	print(icons)
	print(palette)
	var intensities = [3,5,7]
	print(intensities)
	var characters = []
	characters.append("Joe")
	characters.append("Jonnu")
	characters.push_back("Roger")
	characters.push_front("Dylan")
	characters.append("Gin")
	print(characters)
	var is_roger_here = "Roger" in characters
	print(is_roger_here)
	characters.sort()
	print(characters)
	characters.reverse()
	print(characters)
	characters.shuffle()
	print(characters)
	characters.shuffle()
	print(characters)
	characters.shuffle()
	print(characters)
	var good_people = characters.filter(contains_a)
	print(good_people)
	var loud_people = characters.map(uppercase)
	print(loud_people)
	print(characters.filter(contains_a).map(uppercase))
	print(characters.map(uppercase).filter(contains_a))
	var bad_people = characters.filter(func(s): return not contains_a(s))
	print(bad_people)
	print(bad_people[0]," ",bad_people[2])
	print(bad_people[0] + " " + bad_people[2])
	print("Le premier c'est %s, le troisième c'est %s" % [bad_people[0], bad_people[2]])
	print(" EST MEILLEUR QUE ".join(["Paul", "Ringo", "John", "George"])) 
	print( " ".join( [ bad_people[0] , bad_people[2], "Carl" ] ) )
	var tableau_de_10_entiers = range(0,10)
	print(tableau_de_10_entiers)
	print(range(2,10))
	print(range(2,10,3))
	print(range(20,10,-3))
	
	var i = 0
	var nb_characters = characters.size()
	while i < nb_characters:
		print(characters[i])
		i += 1
	
	var j_indexes = range(0,nb_characters)
	for j in j_indexes:
		print(uppercase(characters[j]))
	
	for chara in characters:
		print(chara)
		
	exo_one()

# Retourne la chaîne s mais en majuscules
func uppercase(s: String):
	return s.to_upper()

func contains_a(s: String) -> bool:
	if "a" in s or "A" in s:
		return true
	else:
		return false

func contains_b(s):
	return "b" in s

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func exo_one():
	var icons = $%icon_container.get_children()
#	var palet = 0
#	for icon in icons:
#		icon.modulate = palette[palet]
#		palet += 1
#
	var palet = 0
	while palet < palette.size() :
		icons[palet].modulate = palette[palet]
		palet += 1
