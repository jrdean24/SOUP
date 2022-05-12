package character;

import flixel.FlxG;
import flixel.FlxSprite;

class NPC extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0, GraphicName:String)
	{
		super(x, y);

		loadGraphic(GraphicName, false, 50, 50);
	}
}
