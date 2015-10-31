
(function(){
	
	var RTTTL = {};
	
	var values = "a, a#, b, h, c, c#, d, d#, e, f, f#, g, g#, p".split(", ")
	
	RTTTL.parse = function(str){
		var sections = str.split(":");
		if(sections.length !== 3){
			throw new Error("not 3 sections but "+sections.length+"?");
		}
		var nameSection = sections[0];
		var defaultsSection = sections[1].replace(/\s/g, "");
		var dataSection = sections[2].replace(/\s/g, "");
		
		// parse name section
		var name = nameSection.trim();
		
		// parse defaults section
		var defaults = {};
		var assignments = defaultsSection.split(",");
		for(var i=0; i<assignments.length; i++){
			[option, value] = assignments[i].split("=");
			
		}
		
		// parse data section
		var notes = [];
		
		return {
			name: name,
			defaults: defaults,
			notes: notes
		};
	};
	
	if(typeof module !== "undefined" && module.exports){
		module.exports = RTTTL;
	}else{
		window.RTTTL = RTTTL;
	}
	
	var ringtone = RTTTL.parse("Never Go:d=4,o=6,b=125:g#5, a#5, c#5, a#5, 8f.5, 8f.5, d#.5, g#5, a#5, c#5, a#5, 8d#.5, 8d#.5, 8c#.5, c5, 8a#5, g#5, a#5, c#5, a#5, c#5, 8d#5, 8c.5, a#5, g#5, 8g#5, 8d#5, 8c#5, 2c#5, g#5, a#5, c#5, a#5, f5, 8f5, d#.5, g#5, a#5, c#5, a#5, g#5, 8c#5, 8c#.5, c5, 8a#5, g#5, a#5, c#5, a#5, c#5, 8d#5, 8c.5, a#5, g#5, 8g#5, d#5, c#5");
	console.log(ringtone);
	
	var ringtone = RTTTL.parse("Indiana Jones:d=4,o=5,b=250:e,8p,8f,8g,8p,1c6,8p.,d,8p,8e,1f,p.,g,8p,8a,8b,8p,1f6,p,a,8p,8b,2c6,2d6,2e6,e,8p,8f,8g,8p,1c6,p,d6,8p,8e6,1f.6,g,8p,8g,e.6,8p,d6,8p,8g,e.6,8p,d6,8p,8g,f.6,8p,e6,8p,8d6,2c6");
	console.log(ringtone);
	
	/*
	function Ringtone(str){
		this.name = "";
		this.notes = [];
		if(str){
			this.parse(str);
		}
	}
	
	Ringtone.prototype.parse = function(str){
		
	};
	
	Ringtone.parse = function(str){
		return new Ringtone(str);
	};
	
	if(typeof module !== "undefined" && module.exports){
		module.exports = Ringtone;
	}else{
		window.Ringtone = Ringtone;
	}*/
}());
