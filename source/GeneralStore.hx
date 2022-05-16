package;

import character.Hero;
import character.Inventory;
import character.NPC;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.Ingredient;
import item.Wall;

// Onion Shop
class GeneralStore extends FlxState
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

	var hero:Hero;
	var onionGal:NPC;
	var checkoutCounterBox:Wall;
	var talkBox:Wall;
	var yellowFlowerTrade:Ingredient;
	var redFlowerTrade:Ingredient;
	var walls:FlxTypedGroup<Wall>;
	var redFlowers:FlxTypedGroup<Ingredient>;
	var yellowFlowers:FlxTypedGroup<Ingredient>;
	var blueFlowers:FlxTypedGroup<Ingredient>;
	var randomXLocation:Float = 0;
	var randomYLocation:Float = 0;
	var textBox:Ingredient;
	var instructions:FlxText;
	var instructionStart:Wall;

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
		walls.add(new Wall(0, 999, 1400, 1)); // bottom border
		walls.add(new Wall(1399, 0, 1, 1000)); // west Border
		add(walls);

		instructionStart = new Wall(0, 0, 1400, 1000);
		add(instructionStart);

		add(new FlxSprite(0, 0, "assets/images/Flower_Field.png"));

		onionGal = new NPC(800, 200, "assets/images/onionLadySouth.png");
		add(onionGal);

		yellowFlowerTrade = new Ingredient(100, 400, "assets/images/souperSpice.png");
		add(yellowFlowerTrade);

		redFlowerTrade = new Ingredient(250, 400, "assets/images/onion.png");
		add(redFlowerTrade);

		yellowFlowers = new FlxTypedGroup<Ingredient>();
		for (i in 0...30)
		{
			randomizeLocation();
			yellowFlowers.add(new Ingredient(randomXLocation, randomYLocation, "assets/images/Yellow_Flower.png"));
		}
		add(yellowFlowers);

		blueFlowers = new FlxTypedGroup<Ingredient>();
		for (i in 0...30)
		{
			randomizeLocation();
			blueFlowers.add(new Ingredient(randomXLocation, randomYLocation, "assets/images/Blue_Flower.png"));
		}
		add(blueFlowers);

		redFlowers = new FlxTypedGroup<Ingredient>();
		for (i in 0...30)
		{
			randomizeLocation();
			redFlowers.add(new Ingredient(randomXLocation, randomYLocation, "assets/images/Red_Flower.png"));
		}
		add(redFlowers);

		hero = new Hero(50, 250);
		add(hero);

		textBox = new Ingredient(25, 400, "assets/images/Text_Box.png");
		instructions = new FlxText(50, 425, 1300, " ", 24);

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

	private function randomizeLocation()
	{
		randomXLocation = FlxG.random.float(0, 1300);
		randomYLocation = FlxG.random.float(550, 900);
	}

	public function AddRedFlower(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		inventory.addRedFlowers(1);
		redFlowerNum.text = " " + inventory.redFlower;
	}

	public function AddYellowFlower(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		inventory.addYellowFlowers(1);
		yellowFlowerNum.text = " " + inventory.yellowFlower;
	}

	public function AddBlueFlower(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		inventory.addBlueFlowers(1);
		blueFlowerNum.text = " " + inventory.blueFlower;
	}

	public function RedFlowerForOnion(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		if (inventory.redFlower >= 27)
		{
			inventory.consumeRedFlowers(27);
			inventory.addOnions(9);
			onionNum.text = " " + inventory.onions;
			redFlowerNum.text = " " + inventory.redFlower;
			obj1.kill();
		}
	}

	public function YellowFlowerForSouperSpice(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		if (inventory.yellowFlower >= 81)
		{
			inventory.consumeYellowFlowers(81);
			inventory.addSouperSpice(3);
			souperSpiceNum.text = " " + inventory.souperSpice;
			yellowFlowerNum.text = " " + inventory.yellowFlower;
			obj1.kill();
		}
	}

	private function DisplayInstructions(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		add(textBox);
		add(instructions);
		instructions.text = "Hello, welcome to the General Store. Pick some flowers to trade for Onions and Souper Spice. 27 red flowers for onions, and 81 yellow flowers for Souper Spice. Walk to the Onions and Spice when you have enough flowers to trade. Enter to exit";
		if (FlxG.keys.justPressed.ENTER)
		{
			textBox.kill();
			instructions.kill();
		}
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(redFlowers, hero, AddRedFlower);
		FlxG.overlap(yellowFlowers, hero, AddYellowFlower);
		FlxG.overlap(blueFlowers, hero, AddBlueFlower);
		FlxG.overlap(redFlowerTrade, hero, RedFlowerForOnion);
		FlxG.overlap(yellowFlowerTrade, hero, YellowFlowerForSouperSpice);
		FlxG.collide(hero, walls);
		FlxG.overlap(instructionStart, hero, DisplayInstructions);

		if (FlxG.keys.justReleased.R)
		{
			FlxG.switchState(new MapScene(inventory));
		}

		super.update(elapsed);
	}
}
