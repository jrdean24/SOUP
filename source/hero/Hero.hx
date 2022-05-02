package hero;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Hero extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		// load graphic later on
		makeGraphic(40, 80, FlxColor.WHITE, false, "Hero");
	}
}
