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

class SceneTemplate extends FlxState
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
	var returnDisplayBox:Wall;
	var inventoryDisplayBox:Wall;

	var walls:FlxTypedGroup<Wall>;
	var hero:Hero;

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
		walls.add(new Wall(0, 900, 1400, 100)); // bottom border
		walls.add(new Wall(1300, 0, 100, 1000)); // west Border
		add(walls);

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

		hero = new Hero(650, 850);
		add(hero);
	}

	private function backToMap()
	{
		FlxG.switchState(new MapScene(inventory));
	}

	override public function update(elapsed:Float)
	{
		FlxG.collide(hero, walls);

		if (FlxG.keys.justReleased.R)
		{
			FlxG.switchState(new MapScene(inventory));
		}

		super.update(elapsed);
	}
}
