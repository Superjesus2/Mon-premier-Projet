extends CanvasLayer

var boxes = []
var checked_boxes = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0,100):
		var button = Button.new()
		boxes.append(button)
		button.text = "OK"
		$grid.add_child(button)
		button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER | Control.SIZE_FILL
		button.size_flags_vertical = Control.SIZE_SHRINK_CENTER | Control.SIZE_FILL
		button.pressed.connect(func(): _on_button_pressed(i))
		#Il faut rester dans la boucle pour mentionner "i"
		#Il faut appeler une fonction en argument de "connect" (en réponse au signal pressed de "button")
		#Et non pas le résultat de l'exécution de cette fonction
#autrement dit :
		#		var declenche_ce_bouton = func(): _on_button_pressed(i)
		#		button.pressed.connect(declenche_ce_bouton)

func _on_button_pressed(i):
	print(i)
	print(boxes[i])
	
	# retenir qu'on a appuyé sur cette boîte
	checked_boxes.append(i)
	
	_check_whether_game_ended()
	
	# désactive tous les boutons
	for j in range(0,100):
		boxes[j].disabled = true
	
	# réactive les boutons appropriés
	for j in range(0,100):
		if can_press_on_j_after_pressing_on_i(i, j):
			boxes[j].disabled = false

func can_press_on_j_after_pressing_on_i(i, j):
	var x_i = i % 10
	var y_i = (i - x_i)/10
	var x_j = j % 10
	var y_j = (j - x_j)/10
	return i + 2 == j

func _check_whether_game_ended():
	# dépend de checked_boxes
	pass
