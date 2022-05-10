package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;

class MapScene extends FlxState
{
	var scene1Button:FlxButtonPlus;
	var scene2Button:FlxButtonPlus;

	override public function create()
	{
		super.create();

		scene1Button = new FlxButtonPlus(50, 50, goToScene1, "Scene 1", 200, 50);
		add(scene1Button);

		scene2Button = new FlxButtonPlus(50, 100, goToScene2, "Scene 2", 200, 50);
		add(scene2Button);
	}

	private function goToScene1()
	{
		FlxG.switchState(new Scene1());
	}

	private function goToScene2()
	{
		FlxG.switchState(new Scene2());
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
