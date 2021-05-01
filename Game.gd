extends Node
onready var message = $Message
onready var tile = $Title
onready var correct_btn = $Correct

var guess
var min_number = 0
var max_number = 1000
var ended = false

func _ready():
	guess = (min_number + max_number) / 2
	print('----------------------------')
	print('----------------------------')
	print('----------------------------')
	print('Hello from number guesser!')
	print("I'll guess any number that you think of between 0 and 1000")
	message.text = "Is " + str(guess) + " your number?"


func _process(delta):
	if Input.is_action_just_pressed("up"):
		_try_guess('up')
	elif Input.is_action_just_pressed("down"):
		_try_guess('down')
	elif Input.is_action_just_pressed("space"):
		if ended:
			_restart_gane()
		else:
			_end_game()
		
			
func _try_guess(type):
	if type == "up":
		min_number = guess
	else:
		max_number = guess
	guess = (min_number + max_number) / 2
	print("Is " + str(guess) + " your number?")
	message.text = "Is " + str(guess) + " your number?"


func _end_game():
	ended = true
	message.text = "Yes! I knew it! Your number was: " + str(guess) + "."
	correct_btn.text = "Restart game"
	
	
func _restart_gane():
	get_tree().reload_current_scene()
	correct_btn.text = "Correct"


func _on_Greater_pressed():
	_try_guess("up")


func _on_Lesser_pressed():
	_try_guess("down")


func _on_Correct_pressed():
	if ended:
		_restart_gane()
	else:
		_end_game()
