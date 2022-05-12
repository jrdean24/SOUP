package;

import character.Inventory;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.Wall;

// Win Screens
class Scene7 extends FlxState
{
	var inventory:Inventory;

	var inventoryDisplayBox:Wall;
	var carrotNum:FlxText;
	var potatoNum:FlxText;
	var onionNum:FlxText;
	var milkNum:FlxText;
	var souperSpiceNum:FlxText;
	var redFlowerNum:FlxText;
	var yellowFlowerNum:FlxText;
	var hero:character.Hero;
	var totalPts:Int = 0;

	public function new(incomingInventory:Inventory)
	{
		super();
		inventory = incomingInventory;
	}

	override public function create()
	{
		super.create();

		inventoryDisplayBox = new Wall(1100, 0, 300, 300);
		inventoryDisplayBox.color = FlxColor.GRAY;
		carrotNum = new FlxText(1100, 20, 0, "Carrots: " + inventory.carrots, 24, true);
		potatoNum = new FlxText(1100, 50, 0, "Potatoes: " + inventory.potatoes, 24, true);
		onionNum = new FlxText(1100, 80, 0, "Milk: " + inventory.milk, 24, true);
		milkNum = new FlxText(1100, 110, 0, "Onions: " + inventory.onions, 24, true);
		souperSpiceNum = new FlxText(1100, 140, 0, "Souper Spice: " + inventory.souperSpice, 24, true);
		redFlowerNum = new FlxText(1100, 170, 0, "Red Flowers: " + inventory.redFlower, 24, true);
		yellowFlowerNum = new FlxText(1100, 200, 0, "Yellow Flowers: " + inventory.yellowFlower, 24, true);
		add(inventoryDisplayBox);
		add(potatoNum);
		add(onionNum);
		add(milkNum);
		add(souperSpiceNum);
		add(redFlowerNum);
		add(yellowFlowerNum);
		add(carrotNum);

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

		if (totalPts == 6)
		{
			add(new FlxText(200, 200, 0, "COMPLETED 100%!", 32));
			add(new FlxText(200, 300, 0, "You are a Souper Chef!", 32));
		}
		if (totalPts > 0 && totalPts < 6)
		{
			add(new FlxText(200, 200, 0, "The Legendary Soup is somewhat complete...", 32));
			add(new FlxText(200, 300, 0, "You are a somewhat decent chef, we suppose...", 32));
		}
		if (totalPts == 0)
		{
			add(new FlxText(200, 200, 0, "You have made Air Soup", 32));
			add(new FlxText(200, 300, 0, "You call yourself a chef?!?!", 32));
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
