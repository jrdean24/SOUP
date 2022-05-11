package item;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Ingredient extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0, GraphicName:String)
	{
		super(x, y);

		loadGraphic(GraphicName, false, 50, 50);
	}
}
