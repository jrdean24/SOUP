package item;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Wall extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0, wallWidth:Int = 10, wallHeight:Int = 10)
	{
		super(x, y);
		makeGraphic(wallWidth, wallHeight, FlxColor.WHITE, false, "Wall");
		immovable = true;
	}
}
