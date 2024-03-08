extends CanvasLayer

var boxes = []
var checked_boxes = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0,100):
		var button = Button.new()
		boxes.append(button)
		button.text = "  "
#		button.theme_override_styles/pressed
		$grid.add_child(button)
		button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER | Control.SIZE_EXPAND_FILL
		button.size_flags_vertical = Control.SIZE_SHRINK_CENTER | Control.SIZE_EXPAND_FILL
		button.pressed.connect(func(): _on_button_pressed(i))
		button.pressed.connect(func(): )
		#Il faut rester dans la boucle pour mentionner "i"
		#Il faut appeler une fonction en argument de "connect" (en réponse au signal pressed de "button")
		#Et non pas le résultat de l'exécution de cette fonction
#autrement dit :
		#		var declenche_ce_bouton = func(): _on_button_pressed(i)
		#		button.pressed.connect(declenche_ce_bouton)

func _on_button_pressed(i):
		# retenir qu'on a appuyé sur cette boîte
	checked_boxes.append(i)
	



		# game over ou pas game over ?
	_check_whether_game_ended()
	
		# désactive tous les boutons
	for j in range(0,100):
		boxes[j].disabled = true
		for k in checked_boxes:
			checked_boxes[k].theme_override_styles()
	
		# réactive les boutons appropriés
	for j in range(0,100):
		if can_press_on_j_after_pressing_on_i(i, j):
			boxes[j].disabled = false
#		if box_is_checked(i):
#			pass

	

func can_press_on_j_after_pressing_on_i(i, ji):
	var x_i = i % 10
	var y_i = (i - x_i)/10
	var x_ji = ji % 10
	var y_ji = (ji - x_ji)/10
	
			# DIAGONALES
	if ji not in checked_boxes :
		if x_ji == x_i - 2 and y_ji == y_i - 2 :
			return ji 
		if x_ji == x_i + 2 and y_ji == y_i - 2 :
			return ji 
		if x_ji == x_i - 2 and y_ji == y_i + 2 :
			return ji 
		if x_ji == x_i + 2 and y_ji == y_i + 2 :
			return ji
		
			#HORIZONTALES
	if ji not in checked_boxes :
		if x_ji == x_i - 3 and y_ji == y_i :
			return ji
		if x_ji == x_i + 3 and y_ji == y_i :
			return ji
		if y_ji == y_i - 3 and x_ji == x_i :
			return ji
		if y_ji == y_i + 3 and x_ji == x_i :
			return ji



func _check_whether_game_ended():
#	if checked_boxes > 1 :
#		return false
	pass
