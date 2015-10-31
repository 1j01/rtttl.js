
# RTTTL = require './rtttl.coffee'
# {AudioContext, AudioParam} = require 'web-audio-api'
# context = new AudioContext

context = new (
	window.AudioContext ?
	window.webkitAudioContext ?
	window.mozAudioContext ?
	window.oAudioContext ?
	window.msAudioContext
)

master = context.createGain()
master.connect context.destination
master.gain.value = 0.1

noteVolume = context.createGain()
noteVolume.connect master
noteVolume.gain.value = 0

osc = context.createOscillator()
osc.start 0
osc.connect noteVolume


playingSong = null
playingTime = 0
@isPlaying = (song)->
	return no if song? and song isnt playingSong
	context.currentTime < playingTime

@play = (ringtone)->
	stop()
	playingSong = ringtone
	t = context.currentTime + 0.05
	for note in ringtone.notes
		unless note.rest
			osc.frequency.setValueAtTime note.frequency, t
			noteVolume.gain.setValueAtTime 0, t
			noteVolume.gain.linearRampToValueAtTime 1, t + 0.001
			noteVolume.gain.exponentialRampToValueAtTime 1, t + note.seconds-0.01-0.04
			noteVolume.gain.linearRampToValueAtTime 0, t + note.seconds-0.01
		
		t += note.seconds
		playingTime = t

@stop = ->
	playingTime = 0
	playingSong = null
	t = context.currentTime
	osc.frequency.cancelScheduledValues t
	noteVolume.gain.cancelScheduledValues t
	#noteVolume.gain.setValueAtTime 0, t
	noteVolume.gain.linearRampToValueAtTime 0, t + 0.01



#play RTTTL.parse "USA National Anthem:d=8,o=5,b=120:e.,d,4c,4e,4g,4c6.,p,e6.,d6,4c6,4e,4f#,4g.,p,4g,4e6.,d6,4c6,2b,a,4b,c6.,16p,4c6,4g,4e,32p,4c"
#play RTTTL.parse "Deep Purple-Smoke on the Water:d=4,o=4,b=112:c,d#,f.,c,d#,8f#,f,p,c,d#,f.,d#,c,2p,8p,c,d#,f.,c,d#,8f#,f,p,c,d#,f.,d#,c"

#play RTTTL.parse "Never Go:d=4,o=6,b=125:g#5, a#5, c#5, a#5, 8f.5, 8f.5, d#.5, g#5, a#5, c#5, a#5, 8d#.5, 8d#.5, 8c#.5, c5, 8a#5, g#5, a#5, c#5, a#5, c#5, 8d#5, 8c.5, a#5, g#5, 8g#5, 8d#5, 8c#5, 2c#5, g#5, a#5, c#5, a#5, f5, 8f5, d#.5, g#5, a#5, c#5, a#5, g#5, 8c#5, 8c#.5, c5, 8a#5, g#5, a#5, c#5, a#5, c#5, 8d#5, 8c.5, a#5, g#5, 8g#5, d#5, c#5"
#play RTTTL.parse "Indiana Jones:d=4,o=5,b=250:e,8p,8f,8g,8p,1c6,8p.,d,8p,8e,1f,p.,g,8p,8a,8b,8p,1f6,p,a,8p,8b,2c6,2d6,2e6,e,8p,8f,8g,8p,1c6,p,d6,8p,8e6,1f.6,g,8p,8g,e.6,8p,d6,8p,8g,e.6,8p,d6,8p,8g,f.6,8p,e6,8p,8d6,2c6"
