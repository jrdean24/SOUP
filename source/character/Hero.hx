package character;

import flixel.FlxG;
import flixel.FlxSprite;

class Hero extends FlxSprite
{
	var SPEED:Int = 200;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		loadGraphic("assets/images/heroSouth.png");
		width = 60;
		height = 120;
		offset.x = 10;
		offset.y = 8;
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.pressed.LEFT)
		{
			velocity.x = -SPEED;
			velocity.y = 0;
			loadGraphic("assets/images/heroWest.png", false, 40, 67);
			width = 40;
			height = 120;
			offset.x = 20;
			offset.y = 8;
		}

		if (FlxG.keys.pressed.RIGHT)
		{
			velocity.x = SPEED;
			velocity.y = 0;
			loadGraphic("assets/images/heroEast.png", false, 40, 67);
			width = 40;
			height = 120;
			offset.x = 20;
			offset.y = 8;
		}

		if (FlxG.keys.pressed.UP)
		{
			velocity.y = -SPEED;
			velocity.x = 0;
			loadGraphic("assets/images/heroNorth.png", false, 40, 67);
			width = 60;
			height = 120;
			offset.x = 10;
			offset.y = 8;
		}

		if (FlxG.keys.pressed.DOWN)
		{
			velocity.y = SPEED;
			velocity.x = 0;
			loadGraphic("assets/images/heroSouth.png", false, 40, 67);
			width = 60;
			height = 120;
			offset.x = 10;
			offset.y = 8;
		}

		if (FlxG.keys.pressed.UP == false && FlxG.keys.pressed.DOWN == false && FlxG.keys.pressed.LEFT == false && FlxG.keys.pressed.RIGHT == false)
		{
			velocity.y = 0;
			velocity.x = 0;
		}
		super.update(elapsed);
	}
}
