package;

import character.Inventory;
import flixel.FlxG;
import flixel.FlxSprite;
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
	var blueFlowerNum:FlxText;
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

		returnDisplayBox = new Wall(0, 0, 1400, 70);
		returnDisplayBox.color = FlxColor.GRAY;
		add(returnDisplayBox);
		add(new FlxText(20, 20, 0, "Use 'R' to return to Map.", 24));

		add(new FlxSprite(425, 10, "assets/images/Carrot.png"));
		add(new FlxSprite(540, 10, "assets/images/Potato.png"));
		add(new FlxSprite(655, 10, "assets/images/milk.png"));
		add(new FlxSprite(770, 10, "assets/images/onion.png"));
		add(new FlxSprite(885, 10, "assets/images/souperSpice.png"));
		add(new FlxSprite(1000, 10, "assets/images/redFlowerIcon.png"));
		add(new FlxSprite(1115, 10, "assets/images/yellowFlowerIcon.png"));
		add(new FlxSprite(1230, 10, "assets/images/blueFlowerIcon.png"));
		carrotNum = new FlxText(475, 20, 0, " " + inventory.carrots, 24, true);
		potatoNum = new FlxText(590, 20, 0, " " + inventory.potatoes, 24, true);
		milkNum = new FlxText(705, 20, 0, " " + inventory.milk, 24, true);
		onionNum = new FlxText(820, 20, 0, " " + inventory.onions, 24, true);
		souperSpiceNum = new FlxText(935, 20, 0, " " + inventory.souperSpice, 24, true);
		redFlowerNum = new FlxText(1050, 20, 0, " " + inventory.redFlower, 24, true);
		yellowFlowerNum = new FlxText(1165, 20, 0, " " + inventory.yellowFlower, 24, true);
		blueFlowerNum = new FlxText(1280, 20, 0, " " + inventory.blueFlower, 24, true);
		add(inventoryDisplayBox);
		add(carrotNum);
		add(potatoNum);
		add(milkNum);
		add(onionNum);
		add(souperSpiceNum);
		add(redFlowerNum);
		add(yellowFlowerNum);
		add(blueFlowerNum);

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
