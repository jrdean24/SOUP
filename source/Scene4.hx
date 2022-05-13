package;

import character.Hero;
import character.Inventory;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import item.BackgroundBox;
import item.Ingredient;
import item.Wall;

// Milk Barn
class Scene4 extends FlxState
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
	var milkCount:Int = 0;
	var walls:FlxTypedGroup<item.Wall>;
	var wallForPail:FlxTypedGroup<item.Wall>;
	var cows:FlxTypedGroup<item.BackgroundBox>;
	var pail1:item.Ingredient;
	var pail2:item.Ingredient;
	var pailFillingBuffer1:Int = 200;
	var pailFillingBuffer2:Int = 200;
	var emptyBucket1:Bool = true;
	var emptyBucket2:Bool = true;
	var benchBox:item.BackgroundBox;

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

		walls = new FlxTypedGroup<item.Wall>();
		walls.add(new Wall(0, 0, 1400, 250)); // top border
		walls.add(new Wall(0, 0, 10, 1000)); // east border
		walls.add(new Wall(0, 990, 1400, 10)); // bottom border
		walls.add(new Wall(1390, 0, 10, 1000)); // west Border
		walls.add(new Wall(100, 200, 200, 200)); // hay bale
		add(walls);

		wallForPail = new FlxTypedGroup<item.Wall>();
		wallForPail.add(new Wall(0, 0, 1400, 400)); // top border
		wallForPail.add(new Wall(0, 0, 110, 1000)); // east border
		wallForPail.add(new Wall(0, 840, 1400, 160)); // bottom border
		wallForPail.add(new Wall(1290, 0, 110, 1000)); // west Border
		wallForPail.add(new Wall(100, 200, 350, 350)); // hay bale
		add(wallForPail);

		cows = new FlxTypedGroup<item.BackgroundBox>();
		cows.add(new BackgroundBox(525, 275, 250, 150));
		cows.add(new BackgroundBox(1000, 325, 250, 150));
		cows.add(new BackgroundBox(1200, 650, 100, 300));
		add(cows);

		benchBox = new BackgroundBox(300, 830, 200, 200);
		add(benchBox);

		add(new FlxSprite(0, 0, "assets/images/Cows.png"));

		pail1 = new Ingredient(400, 600, "assets/images/milkPail.png");
		pail2 = new Ingredient(650, 600, "assets/images/milkPail.png");
		pail1.width = 60;
		pail1.height = 80;
		pail1.offset.x = 25;
		pail1.offset.y = 5;
		pail2.width = 60;
		pail2.height = 80;
		pail2.offset.x = 25;
		pail2.offset.y = 5;
		add(pail1);
		add(pail2);

		hero = new Hero(50, 500);
		add(hero);

		inventoryDisplayBox = new Wall(1090, 0, 300, 250);
		inventoryDisplayBox.color = FlxColor.GRAY;
		carrotNum = new FlxText(1100, 20, 0, "Carrots: " + inventory.carrots, 24, true);
		potatoNum = new FlxText(1100, 50, 0, "Potatoes: " + inventory.potatoes, 24, true);
		milkNum = new FlxText(1100, 80, 0, "Milk Bottles: " + inventory.milk, 24, true);
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

	public function AddMilk(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		milkCount += 2;
		inventory.addMilk(2);
		milkNum.text = "Milk Bottles: " + inventory.milk;
	}

	public function FillBucket1(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		pailFillingBuffer1--;
	}

	public function FillBucket2(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		pailFillingBuffer2--;
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new MapScene(inventory));
		}

		FlxG.overlap(cows, pail1, FillBucket1);
		FlxG.overlap(cows, pail2, FillBucket2);
		FlxG.collide(hero, pail1);
		FlxG.collide(hero, pail2);
		FlxG.collide(hero, walls);
		FlxG.collide(pail1, wallForPail);
		FlxG.collide(pail2, wallForPail);

		if (pailFillingBuffer1 == 0 && emptyBucket1)
		{
			pail1.loadGraphic("assets/images/fullMilkPail.png");
			emptyBucket1 = false;
			pail1.width = 60;
			pail1.height = 80;
			pail1.offset.x = 25;
			pail1.offset.y = 5;
		}

		if (pailFillingBuffer2 == 0 && emptyBucket2)
		{
			pail2.loadGraphic("assets/images/fullMilkPail.png");
			emptyBucket2 = false;
			pail2.width = 60;
			pail2.height = 80;
			pail2.offset.x = 25;
			pail2.offset.y = 5;
		}

		if (emptyBucket1 == false)
		{
			FlxG.overlap(pail1, benchBox, AddMilk);
		}
		if (emptyBucket2 == false)
		{
			FlxG.overlap(pail2, benchBox, AddMilk);
		}

		super.update(elapsed);
	}
}
