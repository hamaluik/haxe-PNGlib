(function (console) { "use strict";
var Sample = function() { };
Sample.main = function() {
	var p = new PNGlib(256,256,256);
	var background = p.color(0,0,0,0);
	var _g = 0;
	while(_g < 256) {
		var i = _g++;
		var _g1 = 0;
		while(_g1 < 256) {
			var j = _g1++;
			var dist = Math.sqrt((i - 128) * (i - 128) + (j - 128) * (j - 128));
			if(dist < 32) p.buffer[p.index(i,j)] = p.color(255,255,255); else if(dist < 64) p.buffer[p.index(i,j)] = p.color(251,199,7); else if(dist < 96) p.buffer[p.index(i,j)] = p.color(234,130,32); else if(dist < 128) p.buffer[p.index(i,j)] = p.color(168,75,56); else if(dist < 160) p.buffer[p.index(i,j)] = p.color(20,20,25);
		}
	}
	var base64 = p.getBase64();
	window.document.write("<img src=\"data:image/png;base64," + p.getBase64() + "\">");
};
Sample.main();
})(typeof console != "undefined" ? console : {log:function(){}});
