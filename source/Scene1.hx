package;

import character.Hero;
import character.Inventory;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.Ingredient;
import item.Wall;

// Soup Location
class Scene1 extends FlxState
{
	var inventory:Inventory;

	var inventoryDisplayBox:Wall;
	var returnDisplayBox:Wall;
	var carrotNum:FlxText;
	var potatoNum:FlxText;
	var onionNum:FlxText;
	var milkNum:FlxText;
	var souperSpiceNum:FlxText;
	var redFlowerNum:FlxText;
	var yellowFlowerNum:FlxText;
	var returntoMap:FlxButtonPlus;
	var hero:character.Hero;
	var pot:item.Ingredient;
	var winScreenSprite:Wall;
	var backgroundSprite:FlxSprite;

	public function new(incomingInventory:Inventory)
	{
		super();
		inventory = incomingInventory;
	}

	override public function create()
	{
		super.create();

		// TODO: Add Walls
		winScreenSprite = new Wall(700, 500, 100, 100);
		add(winScreenSprite);

		backgroundSprite = new FlxSprite(0, 0, "assets/images/SoupLocation.png");
		add(backgroundSprite);

		pot = new Ingredient(655, 400, "assets/images/Pot.png");
		add(pot);

		add(new FlxText(100, 270, 1200, "Total needed: 18 Carrots, 17 Potatoes, 4 Bottles of Milk, 9 Onions, and 3 Parts Souper Spice", 20));
		add(new FlxText(400, 200, 0, "Go to Pot to Make Soup", 38));

		hero = new Hero(50, 50);
		add(hero);

		inventoryDisplayBox = new Wall(1110, 0, 300, 250);
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

		returnDisplayBox = new Wall(0, 0, 400, 70);
		returnDisplayBox.color = FlxColor.GRAY;
		add(returnDisplayBox);
		add(new FlxText(20, 20, 0, "Use 'R' to return to Map.", 24));
	}

	private function backToMap()
	{
		FlxG.switchState(new MapScene(inventory));
	}

	private function goToWinScreen(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new Scene7(inventory));
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(winScreenSprite, hero, goToWinScreen);

		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new MapScene(inventory));
		}

		super.update(elapsed);
	}
}
