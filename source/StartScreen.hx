package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

// Start Screen
class StartScreen extends FlxState
{
	override public function create()
	{
		super.create();

		add(new FlxSprite(0, 0, "assets/images/Start_Screenenter.png"));
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new MapScene());
		}

		super.update(elapsed);
	}
}
