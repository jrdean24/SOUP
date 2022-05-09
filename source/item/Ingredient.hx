package item;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Ingredient extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0, GraphicName:String)
	{
		super(x, y);

		// load graphic later on
		makeGraphic(30, 30, FlxColor.WHITE, false, "Ingredient");
	}
}
