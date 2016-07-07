goal = 500 #prompt("how much do you want to write today?")


counter = () ->
	console.log 'count'
	value = document.getElementById('text').value
	regex = /\s+gi/
	wordCount = value.trim().replace(regex, ' ').split(' ').length
	wordCountValue = document.getElementById('wordCount')
	if value.length == 0
		wordCountValue.innerHTML = goal
	else
		wordCountValue.innerHTML = goal - wordCount

counterEvent = () ->
	text = document.getElementById('text')
	counter()
	text.onkeyup = (event) ->
		if event.keyCode == 32
			counter()


document.addEventListener 'DOMContentLoaded', ->
  counterEvent()
  return