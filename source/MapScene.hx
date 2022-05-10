package;

import flixel.text.FlxText;
import character.Inventory;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;

class MapScene extends FlxState
{
	var inventory:Inventory;
	var scene1Button:FlxButtonPlus;
	var scene2Button:FlxButtonPlus;

	public function new(?incomingInventory:Inventory) {
		super();
		if (incomingInventory == null) {
			inventory = new Inventory();
		} 
		else 
		{
			inventory = incomingInventory;
		}
	}

	override public function create()
	{
		super.create();

		scene1Button = new FlxButtonPlus(50, 50, goToScene1, "Scene 1", 200, 50);
		add(scene1Button);

		scene2Button = new FlxButtonPlus(50, 100, goToScene2, "Scene 2", 200, 50);
		add(scene2Button);

		add(new FlxText(0, 20, 0, "Carrots: " + inventory.carrots, 24, true));

	}

	private function goToScene1()
	{
		var nextState = new Scene1(inventory);

		// do a lot of stuff;

		FlxG.switchState(nextState);
	}

	private function goToScene2()
	{
		FlxG.switchState(new Scene2(inventory));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		// TEMP code to return to map:
		if (FlxG.keys.justPressed.R) {
			FlxG.switchState(new MapScene(inventory));
		}
	}
}
