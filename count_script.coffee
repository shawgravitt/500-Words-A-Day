goal = 500 #prompt("how much do you want to write today?")


counter = () ->
	console.log 'count'
	value = document.querySelector('#text').value
	regex = /\s+gi/
	wordCount = value.trim().replace(regex, ' ').split(' ').length
	wordCountValue = document.querySelector('#wordCount')
	if value.length == 0
		wordCountValue.innerHTML = goal
	else
		wordCountValue.innerHTML = goal - wordCount

counterEvent = () ->
	text = document.querySelector('#text')
	counter()
	text.onkeyup = (event) ->
		if event.keyCode == 32
			counter()

copyTextareaBtn = document.querySelector('#copy')
copyTextareaBtn.addEventListener 'click', (event) ->
	copyTextarea = document.querySelector('#text')
	copyTextarea.select()
	try
		successful = document.execCommand('copy')
		msg = if successful then 'successful' else 'unsuccessful'
		console.log 'Copying text command was ' + msg
	catch err
		console.log 'Oops, unable to copy'
	return


document.addEventListener 'DOMContentLoaded', ->
	counterEvent()
	return