package;

import flixel.FlxState;
import haxe.display.Protocol.HaxeResponseErrorData;
import hero.Hero;

class PlayState extends FlxState
{
	var hero:hero.Hero;

	override public function create()
	{
		super.create();

		hero = new Hero(50, 50);
		add(hero);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
