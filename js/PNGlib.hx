package js;

@:native('PNGlib')
extern class PNGlib {
	public function new(width:Int, height:Int, colourDepth:Int);
	public function index(x:Int, y:Int):Int;
	public function color(red:Int, green:Int, blue:Int, ?alpha:Int):Int;
	public function getBase64():String;
	public function getDump():String;
	public var buffer:Array<Int>;
}