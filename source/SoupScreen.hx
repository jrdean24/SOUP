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
	var blueFlowerNum:FlxText;
	var inventoryDisplayBox:Wall;
	var returnDisplayBox:Wall;

	var hero:character.Hero;
	var pot:item.Ingredient;

	var winScreenSprite:Wall;
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
		walls.add(new Wall(0, 0, 1400, 70)); // top border
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

		add(new FlxSprite(0, 0, "assets/images/SoupLocation.png"));

		pot = new Ingredient(655, 400, "assets/images/Pot.png");
		add(pot);

		hero = new Hero(50, 200);
		add(hero);

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
