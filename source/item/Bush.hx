package item;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Bush extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0, GraphicName:String)
	{
		super(x, y);

		makeGraphic(300, 150, FlxColor.GREEN);
		// loadGraphic(GraphicName, false, 50, 50);
	}
}
