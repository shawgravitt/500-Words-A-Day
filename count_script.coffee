goal = 500 #prompt("how much do you want to read today?")


counter = () ->
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
	text.addEventListener 'keyup', (event) ->
		counter()
		return


document.addEventListener 'DOMContentLoaded', ->
  counterEvent()
  return