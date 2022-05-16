package;

import character.Inventory;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.Wall;

// Win Screens
class WinScreens extends FlxState
{
	var inventory:Inventory;

	var carrotNum:FlxText;
	var potatoNum:FlxText;
	var milkNum:FlxText;
	var onionNum:FlxText;
	var souperSpiceNum:FlxText;
	var redFlowerNum:FlxText;
	var yellowFlowerNum:FlxText;
	var inventoryDisplayBox:Wall;
	var returnDisplayBox:Wall;

	var totalPts:Int = 0;

	public function new(incomingInventory:Inventory)
	{
		super();
		inventory = incomingInventory;
	}

	override public function create()
	{
		super.create();

		inventoryDisplayBox = new Wall(1090, 0, 300, 250);
		inventoryDisplayBox.color = FlxColor.GRAY;
		carrotNum = new FlxText(1100, 20, 0, "Carrots: " + inventory.carrots, 24, true);
		potatoNum = new FlxText(1100, 50, 0, "Potatoes: " + inventory.potatoes, 24, true);
		milkNum = new FlxText(1100, 80, 0, "Milk Bottle: " + inventory.milk, 24, true);
		onionNum = new FlxText(1100, 110, 0, "Onions: " + inventory.onions, 24, true);
		souperSpiceNum = new FlxText(1100, 140, 0, "Souper Spice: " + inventory.souperSpice, 24, true);
		redFlowerNum = new FlxText(1100, 170, 0, "Red Flowers: " + inventory.redFlower, 24, true);
		yellowFlowerNum = new FlxText(1100, 200, 0, "Yellow Flowers: " + inventory.yellowFlower, 24, true);
		add(inventoryDisplayBox);
		add(carrotNum);
		add(potatoNum);
		add(milkNum);
		add(onionNum);
		add(souperSpiceNum);
		add(redFlowerNum);
		add(yellowFlowerNum);

		if (inventory.carrots >= 18)
		{
			totalPts += 1;
		}
		if (inventory.potatoes >= 17)
		{
			totalPts += 1;
		}
		if (inventory.milk >= 4)
		{
			totalPts += 1;
		}
		if (inventory.onions >= 9)
		{
			totalPts += 1;
		}
		if (inventory.souperSpice >= 3)
		{
			totalPts += 1;
		}

		if (totalPts == 5)
		{
			add(new FlxText(200, 200, 0, "COMPLETED 100%!", 32));
			add(new FlxText(200, 300, 0, "You are a Souper Chef!", 32));
		}
		else if (totalPts > 0 && totalPts < 5)
		{
			add(new FlxText(200, 200, 0, "The Legendary Soup is somewhat complete...", 32));
			add(new FlxText(200, 300, 0, "You are a somewhat decent chef, we suppose...", 32));
		}
		else if (totalPts == 0)
		{
			add(new FlxText(200, 200, 0, "You have made Air Soup", 32));
			add(new FlxText(200, 300, 0, "You call yourself a chef?!?!", 32));
		}

		returnDisplayBox = new Wall(0, 0, 400, 70);
		returnDisplayBox.color = FlxColor.GRAY;
		add(returnDisplayBox);
		add(new FlxText(20, 20, 0, "Use 'R' to return to Map.", 24));
	}

	private function backToMap()
	{
		FlxG.switchState(new MapScene(inventory));
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new MapScene(inventory));
		}

		super.update(elapsed);
	}
}
