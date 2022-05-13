package item;

import flixel.FlxG;
import flixel.FlxSprite;

class Ingredient extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0, GraphicName:String)
	{
		super(x, y);
		loadGraphic(GraphicName, false, 50, 50);
		drag.x = drag.y = 200;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
