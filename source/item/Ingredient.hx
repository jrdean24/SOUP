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
		if (x < 0)
		{
			velocity.x = 300;
		}
		else if (x > FlxG.width - width)
		{
			velocity.x = -300;
		}
		else if (y < 0)
		{
			velocity.y = 300;
		}
		else if (y > FlxG.height - height)
		{
			velocity.y = -300;
		}

		super.update(elapsed);
	}
}
