package character;

import flixel.FlxG;
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

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.pressed.LEFT)
		{
			velocity.x = -100;
			velocity.y = 0;
		}

		if (FlxG.keys.pressed.RIGHT)
		{
			velocity.x = 100;
			velocity.y = 0;
		}

		if (FlxG.keys.pressed.UP)
		{
			velocity.y = -100;
			velocity.x = 0;
		}

		if (FlxG.keys.pressed.DOWN)
		{
			velocity.y = 100;
			velocity.x = 0;
		}

		if (FlxG.keys.pressed.UP == false && FlxG.keys.pressed.DOWN == false && FlxG.keys.pressed.LEFT == false && FlxG.keys.pressed.RIGHT == false)
		{
			velocity.y = 0;
			velocity.x = 0;
		}

		super.update(elapsed);
	}
}