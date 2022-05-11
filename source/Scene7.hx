package;

import flixel.FlxState;
import flixel.text.FlxText;

// Win Screens
class Scene7 extends FlxState
{
	override public function create()
	{
		super.create();

		add(new FlxText(200, 200, 0, "COMPLETED 100%!", 56));
		add(new FlxText(200, 300, 0, "You are a Souper Chef!", 56));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
