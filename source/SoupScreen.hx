package;

import character.Hero;
import character.Inventory;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.Ingredient;
import item.Wall;

// Soup Location
class SoupScreen extends FlxState
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

	var hero:character.Hero;
	var pot:item.Ingredient;

	var winScreenSprite:Wall;
	var backgroundSprite:FlxSprite;
	var walls:FlxTypedGroup<item.Wall>;

	public function new(incomingInventory:Inventory)
	{
		super();
		inventory = incomingInventory;
	}

	override public function create()
	{
		super.create();

		walls = new FlxTypedGroup<item.Wall>();
		walls.add(new Wall(0, 0, 1400, 1)); // top border
		walls.add(new Wall(0, 0, 1, 1000)); // east border
		walls.add(new Wall(0, 1000, 1400, 1)); // bottom border
		walls.add(new Wall(1400, 0, 1, 1000)); // west Border
		walls.add(new Wall(0, 20, 70, 150)); // top tree
		walls.add(new Wall(820, 900, 200, 100)); // Bottom tree
		walls.add(new Wall(650, 360, 100, 20)); // top log
		walls.add(new Wall(540, 500, 30, 80)); // west log
		walls.add(new Wall(840, 500, 30, 80)); // east log
		add(walls);

		winScreenSprite = new Wall(690, 400, 100, 100);
		add(winScreenSprite);

		backgroundSprite = new FlxSprite(0, 0, "assets/images/SoupLocation.png");
		add(backgroundSprite);

		pot = new Ingredient(655, 400, "assets/images/Pot.png");
		add(pot);

		add(new FlxText(100, 270, 1200, "Total needed: 18 Carrots, 17 Potatoes, 4 Bottles of Milk, 9 Onions, and 3 Parts Souper Spice", 20));
		add(new FlxText(400, 200, 0, "Go to Pot to Make Soup", 38));

		hero = new Hero(50, 200);
		add(hero);

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
		FlxG.switchState(new WinScreens(inventory));
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(winScreenSprite, hero, goToWinScreen);
		FlxG.collide(hero, walls);

		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new MapScene(inventory));
		}

		super.update(elapsed);
	}
}
