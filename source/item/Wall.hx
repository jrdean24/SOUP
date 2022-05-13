package item;

import flixel.FlxSprite;

class Wall extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0, wallWidth:Int = 10, wallHeight:Int = 10)
	{
		super(x, y);
		makeGraphic(wallWidth, wallHeight);
		immovable = true;
	}
}
