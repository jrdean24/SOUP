package item;

import flixel.FlxSprite;

class BackgroundBox extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0, width:Int = 0, height:Int = 0)
	{
		super(x, y);
		makeGraphic(width, height);
	}
}
