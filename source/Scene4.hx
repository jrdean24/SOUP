package;

import character.Hero;
import character.Inventory;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.CowBox;
import item.Wall;

// Milk Barn
class Scene4 extends FlxState
{
	var inventory:Inventory;

	var hero:character.Hero;
	var milkCount:Int = 0;
	var walls:FlxTypedGroup<item.Wall>;
	var cows:FlxTypedGroup<item.CowBox>;
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

	// name to put into load graphics
	var emptyPail:String = "assets/images/milkPail.png";
	var fullPail:String = "assets/images/fullMilkPail.png";

	public function new(incomingInventory:Inventory)
	{
		super();
		inventory = incomingInventory;
	}

	override public function create()
	{
		super.create();

		// TODO: Add Walls Correctly
		/*walls = new FlxTypedGroup<item.Wall>();
			walls.add(new Wall(x, y, width, height));
			add(walls); */

		cows = new FlxTypedGroup<item.CowBox>();
		cows.add(new CowBox(525, 275, 250, 150));
		cows.add(new CowBox(1000, 325, 250, 150));
		cows.add(new CowBox(1200, 650, 100, 300));
		add(cows);

		add(new FlxSprite(0, 0, "assets/images/Cows.png"));

		// TODO: Location for putting pails when finished
		// TODO: Logic for getting milk

		hero = new Hero(50, 50);
		add(hero);

		milkNum = new flixel.text.FlxText(0, 20, 0, "Milk Bottles: " + milkCount, 24, true);
		add(milkNum);

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

	public function AddCarrot(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		milkCount += 1;
		milkNum.text = "Milk Bottles: " + milkCount;
		add(milkNum);
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
