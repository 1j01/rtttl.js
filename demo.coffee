
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
			$rtttl.text("#{ringtone.name}:#{ringtone.controls}:")
			$notes = $(
				for note, i in ringtone.notes
					$rtttl.append(
						if note.toString().match /p/
							$("<span class='rest'>").appendTo($rtttl).text(note.toString())
						else
							$("<span class='note'>").appendTo($rtttl).text(note.toString())
						unless i is ringtone.notes.length - 1 
							$("<span class='comma delimeter'>").appendTo($rtttl).text(",")
					)
			)
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
				
				$ringtone[0].scrollIntoViewIfNeeded() # @TODO: account for padding
			
			ringtone.stop = ->
				stop ringtone
				update()
				clearInterval iid
			
			$play = $("<button class=round>").appendTo($left).click ->
				if isPlaying ringtone
					ringtone.stop()
				else
					unless (location.hash.indexOf ringtone.name) is 1
						history.pushState ringtone.name, ringtone.name, "##{ringtone.name}"	
					ringtone.play()
			
			update()
			
			unless play? and stop?
				$play.attr
					disabled: yes
					title: "Web Audio API support required"

$(window).on "navigate", (event, data)->
	if location.hash.match /#?.+/
		for ringtone in ringtones
			if (location.hash.indexOf ringtone.name) is 1
				ringtone.play?() unless isPlaying ringtone
	else
		for ringtone in ringtones
			ringtone.stop?()

$(window).triggerHandler "navigate"
