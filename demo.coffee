
# @TODO: loading screen (or make it fast!)

ringtones =
	for rtttl in $("#data").remove().text().split("\n")
		do (rtttl)->
			try
				RTTTL.parse rtttl
			catch error
				{error, name: rtttl.split(":")[0], toString: -> rtttl}

for ringtone in ringtones
	do (ringtone)->
		
		$ringtone = $("<article class=song>").appendTo(document.body)
		$left = $("<div class=left>").appendTo($ringtone)
		$right = $("<div class=right>").appendTo($ringtone)
		$title = $("<h1 class=title>").appendTo($right).text(ringtone.name)
		$rtttl = $("<pre class=rtttl>").appendTo($right).text(ringtone.toString())
		
		$ringtone.attr "name", ringtone.name
		
		if ringtone.error
			$error = $("<output class=error>").appendTo($right).text(ringtone.error.message)
		else
			###$rtttl.text("#{ringtone.name}:#{ringtone.controls}:")
			$notes = $(
				for note in ringtone.notes
					$note = $("<span>").appendTo($rtttl).text(note.toString())
					$delimeter = $("<span>").appendTo($rtttl).text(",")
			)###
			iid = -1
			update = ->
				if isPlaying ringtone
					$play.removeClass "play"
					$play.addClass "stop"
					$ringtone.addClass "playing"
				else
					$play.removeClass "stop"
					$play.addClass "play"
					$ringtone.removeClass "playing"
					clearInterval iid
			
			ringtone.play = ->
				play ringtone
				update()
				iid = setInterval update, 50
				
				location.hash = ringtone.name
				$ringtone[0].scrollIntoView() # @TODO: account for padding
			
			ringtone.stop = ->
				stop ringtone
				update()
				clearInterval iid
			
			$play = $("<button class=round>").appendTo($left).click ->
				if isPlaying ringtone
					ringtone.stop()
				else
					ringtone.play()
			
			update()
			
			unless play? and stop?
				$play.attr
					disabled: yes
					title: "Web Audio API support required"

do window.onhashchange = ->
	for ringtone in ringtones when (location.hash.indexOf ringtone.name) is 1
		unless isPlaying ringtone
			ringtone.play?()

