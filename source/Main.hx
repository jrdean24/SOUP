package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(1400, 1000, MapScene));
		// TODO: Figure out how to use a Map/MenuScreen So I dont have to keep changing things here.
	}
}
