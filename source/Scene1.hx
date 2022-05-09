package;

import character.Hero;
import flixel.FlxState;

class Scene1 extends FlxState
{
	var hero:character.Hero;

	override public function create()
	{
		super.create();

		add(new FlxSprite(0, 0, AssetPaths.SoupLocation_png));

		hero = new Hero(50, 50);
		add(hero);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
