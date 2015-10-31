
# RTTTL Format Specification

RTTTL (RingTone Text Transfer Language) is the primary format used to distribute 
ringtones for Nokia phones. An RTTTL file is a text file, containing the 
ringtone name, a control section and a section containing a comma separated 
sequence of ring tone commands. White space must be ignored by any reader 
application, except for spaces in the name, which should be retained.


## Example

Simpsons:d=4,o=5,b=160:32p,c.6,e6,f#6,8a6,g.6,e6,c6,8a,8f#,8f#,8f#,2g

This file describes a ringtone whose name is 'Simpsons'. The control section 
sets the beats per minute at 160, the default note length as 4, and the default 
scale as Octave 5.


## Format

	<RTTTL> := <name> ":" [<control section>] ":" <tone-commands>

		<name> := <char> ; maximum name length 10 characters

		<control-section> := <control-pair> ["," <control-section>]

			<control-pair> := <control-name> "=" <control-value>

			<control-name> := "o" | "d" | "b"
			; Valid in control section: o=default scale, d=default duration, b=default beats per minute. 
			; If not specified, defaults are duration=4, scale=4, beats-per-minute=63
			; Any unknown control-names must be ignored

		<tone-commands> := <tone-command> ["," <tone-commands>]

			<tone-command> := <note> | <control-pair>
			; You can put controls in the tone commands section?
			
			<note> := [<duration>] <note-type> [<special-duration>]

				<duration> := "1" | "2" | "4" | "8" | "16" | "32" 
				; The actual duration is a full note duration divided by <duration>
				; e.g. 4 represents a quarter note

				<note-type> := "P" | <note-name> [<scale>]

				<note-name> := "C" | "C#" | "D" | "D#" | "E" | "F" | "F#" | "G" | "G#" | "A" | "A#" | "B" 

				<scale> := "4" | "5" | "6" | "7"
				; Note that octave 4: A=440Hz, 5: A=880Hz, 6: A=1.76 kHz, 7: A=3.52 kHz
				; The lowest note on the Nokia 61xx is A4, the highest is B7

				<special-duration> := "." ; Dotted note, with 1.5x duration
				; Note that some RTTTL files have dots in between the note name and scale, e.g. 8f.5


### This is a revision

Based on [this original specification](http://wingedshadow.com/rtttl_spec.txt)

See also http://www.mobilefish.com/tutorials/rtttl/rtttl_quickguide_specification.html


