# haxe-PNGlib
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/FuzzyWuzzie/haxe-PNGlib/blob/master/LICENSE)

Haxe externs for the [PNGlib][1] library.

## Usage

```haxe
// create a new PNG image
var p:PNGlib = new PNGlib(width, height, colourDepth);

// access colours in the buffer
p.buffer[p.index(x, y)] = p.color(red, green, blue, alpha);

// output strings describing the file
var outputB64:String = p.getBase64();
var outputPNG:String = p.getDump();
```

**NOTE**: You must import the [PNGlib][1] library into your HTML file for this to work. In case the source ever goes offline, a copy can be found here: https://github.com/FuzzyWuzzie/haxe-PNGlib/blob/master/libs/pnglib.js

## Examples

### Drawing Some Circles

```haxe
var p:PNGlib = new PNGlib(256, 256, 256);
var background:Int = p.color(0, 0, 0, 0);

for(i in 0...256) {
	for(j in 0...256) {
		var dist:Float = Math.sqrt((i - 128)*(i - 128) + (j - 128)*(j - 128));
		if(dist < 32) {
			p.buffer[p.index(i, j)] = p.color(255, 255, 255);
		}
		else if(dist < 64) {
			p.buffer[p.index(i, j)] = p.color(251,199,7);
		}
		else if(dist < 96) {
			p.buffer[p.index(i, j)] = p.color(234, 130, 32);
		}
		else if(dist < 128) {
			p.buffer[p.index(i, j)] = p.color(168,75,56);
		}
		else if(dist < 160) {
			p.buffer[p.index(i, j)] = p.color(20, 20, 25);
		}
	}
}
	
var base64:String = p.getBase64();
js.Browser.document.write('<img src="data:image/png;base64,'+p.getBase64()+'">');
```

Results in:

![Concentric circles](https://raw.githubusercontent.com/FuzzyWuzzie/haxe-PNGlib/master/circles.png)

### Live Sample

A [live sample](http://FuzzyWuzzie.github.io/haxe-PNGlib/) is available which generates a PNG image and embeds it in a webpage.


[1]: http://www.xarg.org/2010/03/generate-client-side-png-files-using-javascript/