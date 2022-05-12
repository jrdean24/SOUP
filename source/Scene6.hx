package;

import character.Hero;
import character.Inventory;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.Ingredient;
import item.Wall;

// Flower Field
class Scene6 extends FlxState
{
	var inventory:Inventory;
	var returntoMap:FlxButtonPlus;
	var inventoryDisplayBox:Wall;
	var returnDisplayBox:Wall;
	var carrotNum:FlxText;
	var potatoNum:FlxText;
	var onionNum:FlxText;
	var milkNum:FlxText;
	var souperSpiceNum:FlxText;
	var redFlowerNum:FlxText;
	var yellowFlowerNum:FlxText;
	var hero:Hero;
	var redFlowers:FlxTypedGroup<Ingredient>;
	var yellowFlowers:FlxTypedGroup<Ingredient>;
	var randomXLocation:Float = 0;
	var randomYLocation:Float = 0;

	public function new(incomingInventory:Inventory)
	{
		super();
		inventory = incomingInventory;
	}

	override public function create()
	{
		super.create();

		redFlowers = new FlxTypedGroup<Ingredient>();
		for (i in 0...35)
		{
			randomizeLocation();
			redFlowers.add(new Ingredient(randomXLocation, randomYLocation, "assets/images/redFlower.png"));
		}
		add(redFlowers);

		yellowFlowers = new FlxTypedGroup<Ingredient>();
		for (i in 0...100)
		{
			randomizeLocation();
			yellowFlowers.add(new Ingredient(randomXLocation, randomYLocation, "assets/images/yellowFlower.png"));
		}
		add(yellowFlowers);

		hero = new Hero(50, 50);
		add(hero);

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

		returnDisplayBox = new Wall(0, 0, 400, 70);
		returnDisplayBox.color = FlxColor.GRAY;
		add(returnDisplayBox);
		add(new FlxText(20, 20, 0, "Use 'R' to return to Map.", 24));
	}

	private function backToMap()
	{
		FlxG.switchState(new MapScene(inventory));
	}

	private function randomizeLocation()
	{
		randomXLocation = FlxG.random.float(100, 1300);
		randomYLocation = FlxG.random.float(100, 900);
	}

	public function AddRedFlower(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		inventory.addRedFlowers(1);
		redFlowerNum.text = "Red Flowers: " + inventory.redFlower;
	}

	public function AddYellowFlower(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		inventory.addYellowFlowers(1);
		yellowFlowerNum.text = "Yellow Flowers: " + inventory.yellowFlower;
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(redFlowers, hero, AddRedFlower);
		FlxG.overlap(yellowFlowers, hero, AddYellowFlower);

		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new MapScene(inventory));
		}
		super.update(elapsed);
	}
}
