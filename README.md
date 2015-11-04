
# rtttl.js

Parse and play [RTTTL](RTTTL.md) files.

[Demo!](http://1j01.github.io/rtttl.js/)

<!--
## Usage

	npm install ringtone

or

	<script src="ringtone.js">

and then

	var ringtone = new Ringtone("Never Go:d=4,o=6,b=125:g#5, a#5, c#5, a#5, 8f.5, 8f.5, d#.5, g#5, a#5, c#5, a#5, 8d#.5, 8d#.5, 8c#.5, c5, 8a#5, g#5, a#5, c#5, a#5, c#5, 8d#5, 8c.5, a#5, g#5, 8g#5, 8d#5, 8c#5, 2c#5, g#5, a#5, c#5, a#5, f5, 8f5, d#.5, g#5, a#5, c#5, a#5, g#5, 8c#5, 8c#.5, c5, 8a#5, g#5, a#5, c#5, a#5, c#5, 8d#5, 8c.5, a#5, g#5, 8g#5, d#5, c#5");

or

	var custom = new Ringtone()
		.defaultNoteLengthFraction(4)
		.defaultOctave(6)
		.tempo(125)
		.note(...)
		.note(...)
		.rest()
		.note(...)
		.name("Something");
	var rtttl = custom.toString();
-->


## License

The MIT License (MIT)

Copyright (c) 2015 Isaiah Odhner

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
