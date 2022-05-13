package;

import character.Hero;
import character.Inventory;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.Wall;

class MapScene extends FlxState
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

	var hero:character.Hero;
	var walls:FlxTypedGroup<item.Wall>;

	var scene1Graphic:FlxSprite;
	var scene2Graphic:FlxSprite;
	var scene3Graphic:FlxSprite;
	var scene4Graphic:FlxSprite;
	var scene5Graphic:FlxSprite;
	var scene6Graphic:FlxSprite;

	public function new(?incomingInventory:Inventory)
	{
		super();
		if (incomingInventory == null)
		{
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

		walls = new FlxTypedGroup<item.Wall>();
		walls.add(new Wall(0, 0, 1400, 1)); // top border
		walls.add(new Wall(0, 0, 1, 1000)); // east border
		walls.add(new Wall(1400, 0, 1, 1000)); // bottom border
		walls.add(new Wall(1400, 1000, 1400, 1)); // Bottom Border
		add(walls);

		scene1Graphic = new FlxSprite(100, 700);
		scene1Graphic.loadGraphic("assets/images/Pot.png", false, 150, 150);
		scene2Graphic = new FlxSprite(300, 700);
		scene2Graphic.loadGraphic("assets/images/Carrot.png", false, 150, 150);
		scene3Graphic = new FlxSprite(500, 700);
		scene3Graphic.loadGraphic("assets/images/Potato.png", false, 150, 150);
		scene4Graphic = new FlxSprite(700, 700);
		scene4Graphic.loadGraphic("assets/images/milk.png", false, 150, 150);
		scene5Graphic = new FlxSprite(900, 700);
		scene5Graphic.loadGraphic("assets/images/onion.png", false, 150, 150);
		scene6Graphic = new FlxSprite(1100, 700);
		scene6Graphic.loadGraphic("assets/images/redflower.png", false, 150, 150);
		add(scene1Graphic);
		add(scene2Graphic);
		add(scene3Graphic);
		add(scene4Graphic);
		add(scene5Graphic);
		add(scene6Graphic);

		add(new FlxText(200, 500, 0, "Gather Ingredients, then return to Scene1.", 38));
		add(new FlxText(250, 550, 0, "Walk to a Scene to go to that location", 38));

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

		hero = new Hero(50, 250);
		add(hero);
	}

	private function goToScene1(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new Scene1(inventory));
	}

	private function goToScene2(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new Scene2(inventory));
	}

	private function goToScene3(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new Scene3(inventory));
	}

	private function goToScene4(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new Scene4(inventory));
	}

	private function goToScene5(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new Scene5(inventory));
	}

	private function goToScene6(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		FlxG.switchState(new Scene6(inventory));
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(scene1Graphic, hero, goToScene1);
		FlxG.overlap(scene2Graphic, hero, goToScene2);
		FlxG.overlap(scene3Graphic, hero, goToScene3);
		FlxG.overlap(scene4Graphic, hero, goToScene4);
		FlxG.overlap(scene5Graphic, hero, goToScene5);
		FlxG.overlap(scene6Graphic, hero, goToScene6);
		FlxG.collide(hero, walls);

		super.update(elapsed);
	}
}
