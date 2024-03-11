extends CanvasLayer

var boxes = []
var checked_boxes = []
var checkable_boxes = 0

func _ready():

	$label_score.visible = false

	$start_button.disabled = false
	$reset_button.disabled = true
	
	$start_button.pressed.connect(func(): _onstart())
	$reset_button.pressed.connect(func(): _reset())

func _onstart():

	$label_score.visible = true
	$checked_boxes_count.text = "0"

	# on nettoie les var pour éviter le stacking du reset
	boxes.clear()
	checked_boxes.clear()
	checkable_boxes = 0
	
	$start_button.disabled = true
	$reset_button.disabled = false

	for ii in range(0,100):
		var button = Button.new()
		boxes.append(button)
		$grid.add_child(button)
		button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER | Control.SIZE_EXPAND_FILL
		button.size_flags_vertical = Control.SIZE_SHRINK_CENTER | Control.SIZE_EXPAND_FILL
		button.pressed.connect(func(): _on_button_pressed(ii))
	#Il faut rester dans la boucle pour mentionner "i"
	#Il faut appeler une fonction en argument de "connect" (en réponse au signal pressed de "button")
	#Et non pas le résultat de l'exécution de cette fonction
#autrement dit :
	#		var declenche_ce_bouton = func(): _on_button_pressed(i)
	#		button.pressed.connect(declenche_ce_bouton)

func _reset():
	for j in range(0,100):
		boxes[j].free()
	$commentaire_sportif.text = ""
	$checked_boxes_count.text = ""
	_onstart()

func _on_button_pressed(i_button):
	
		# retenir qu'on a appuyé sur cette boîte
	checked_boxes.append(i_button)

		# afficher le nomlbre de boites cliquées
	$checked_boxes_count.text = str(checked_boxes.size())

		# désactive tous les boutons
	checkable_boxes = 0
	for j in range(0,100):
		boxes[j].disabled = true
		for k in checked_boxes:
			$grid.get_child(k).modulate = Color(0, 1, 0.2)

		# réactive les boutons appropriés
		# puis game over si aucun bouton n'est réactivé
	for j in range(0,100):
		if can_press_on_j_after_pressing_on_i(i_button, j):
			boxes[j].disabled = false
			checkable_boxes += 1

		# game over ou pas game over ?
	_check_whether_game_ended()

func can_press_on_j_after_pressing_on_i(i, ji):
	var x_i = i % 10
	var y_i = (i - x_i)/10
	var x_ji = ji % 10
	var y_ji = (ji - x_ji)/10
	
	var not_pressed = ji not in checked_boxes
	var same_line_or_column = (abs(x_i-x_ji) == 3 and y_i==y_ji) or (abs(y_i-y_ji) == 3 and x_i==x_ji)
	var on_diagonal = abs(x_i-x_ji) == 2 and abs(y_i-y_ji) == 2
	return not_pressed and (same_line_or_column or on_diagonal)
	# ^ est une factorisation de ce qui suit :
	#	
	#	if ji not in checked_boxes :
	#		if x_ji == x_i - 2 and y_ji == y_i - 2 :
	#			return ji 
	#		if x_ji == x_i + 2 and y_ji == y_i - 2 :
	#			return ji 
	#		if x_ji == x_i - 2 and y_ji == y_i + 2 :
	#			return ji 
	#		if x_ji == x_i + 2 and y_ji == y_i + 2 :
	#			return ji
	#
	#			#HORIZONTALES
	#	if ji not in checked_boxes :
	#		if x_ji == x_i - 3 and y_ji == y_i :
	#			return ji
	#		if x_ji == x_i + 3 and y_ji == y_i :
	#			return ji
	#		if y_ji == y_i - 3 and x_ji == x_i :
	#			return ji
	#		if y_ji == y_i + 3 and x_ji == x_i :
	#			return ji

func _check_whether_game_ended():
	if checked_boxes.size() == 100 :
		game_won()
	if checkable_boxes == 0 :
		game_lost()

func game_won() :
	$commentaire_sportif.text = "Yaaay !"
	$start_button.disabled = true
	$reset_button.disabled = false

func game_lost() :
	
	$start_button.disabled = true
	$reset_button.disabled = false
	
	if checked_boxes.size() < 30 :
		$commentaire_sportif.text = "This is quite unusual, you are VERY bad at this"
	if checked_boxes.size() in range(30,51) :
		$commentaire_sportif.text = "You lost ! Try harder"
	if checked_boxes.size() in range(51,66) :
		$commentaire_sportif.text = "You can do better"
	if checked_boxes.size() in range(66,76) :
		$commentaire_sportif.text = "You're not thinking it through, are you ?"
	if checked_boxes.size() in range(76,86) :
		$commentaire_sportif.text = "You're not bad, but you're not good either"
	if checked_boxes.size() in range(86,93) :
		$commentaire_sportif.text = "Almost there !"
	if checked_boxes.size() in range(93,96) :
		$commentaire_sportif.text = "So close..."
	if checked_boxes.size() in range(96,98) :
		$commentaire_sportif.text = "You deserve a hug"
	if checked_boxes.size() in range(98,100) :
		$commentaire_sportif.text = "Oh, come on !"
