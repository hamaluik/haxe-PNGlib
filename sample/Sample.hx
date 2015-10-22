import js.PNGlib;

class Sample {
	static public function main() {
		var p:PNGlib = new PNGlib(256, 256, 256);
		var background:Int = p.color(0, 0, 0, 0);

		var num:Float = 200 / 10;
		var i:Float = 0;
		while(i <= num) {
			var x:Float = i * 10;
			var y = Math.sin(i) * Math.sin(i) * 50 + 50;

			// use a color triad of Microsofts million dollar color
			p.buffer[p.index(Math.floor(x), Math.floor(y - 10))] = p.color(0x00, 0x44, 0xcc);
			p.buffer[p.index(Math.floor(x), Math.floor(y))] = p.color(0xcc, 0x00, 0x44);
			p.buffer[p.index(Math.floor(x), Math.floor(y + 10))] = p.color(0x00, 0xcc, 0x44);

			i += 0.01;
		}

		for(i in 0...50) {
			for(j in 0...50) {
				p.buffer[p.index(i + 90, j + 135)] = p.color(0xcc, 0x00, 0x44);
				p.buffer[p.index(i + 80, j + 120)] = p.color(0x00, 0x44, 0xcc);
				p.buffer[p.index(i + 100, j + 130)] = p.color(0x00, 0xcc, 0x44);
			}
		}

		var base64:String = p.getBase64();
		js.Browser.document.write('<img src="data:image/png;base64,'+p.getBase64()+'">');
	}
}