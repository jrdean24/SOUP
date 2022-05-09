package;

import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;

{
	var scene1Button:FlxButtonPlus;
	var scene2Button:FlxButtonPlus;

	override
	public function create()
	{
		scene1Button = new FlxButtonPlus(50, 50, goToScene1, "Scene 1", 200, 50);
		add(scene1Button);

		scene2Button = new FlxButtonPlus(50, 100, goToScene2, "Scene 2", 200, 50);
		add(scene2Button);

		super.create();
	}

	private function goToScene1()
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
		{
			FlxG.switchState(new Scene1());
		});
	}

	private function goToScene2()
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
		{
			FlxG.switchState(new Scene2());
		});
	}

	override
	public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
