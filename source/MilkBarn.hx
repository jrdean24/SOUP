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
import item.BackgroundBox;
import item.Ingredient;
import item.Wall;

// Milk Barn
class MilkBarn extends FlxState
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
	var instructionStart:Wall;
	var textBox:Ingredient;
	var instructions:FlxText;
	var milkLady:NPC;

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

		instructionStart = new Wall(50, 500, 100, 100);
		add(instructionStart);

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

		milkLady = new NPC(50, 800, "assets/images/girlSmall.png");
		add(milkLady);

		hero = new Hero(50, 500);
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

	public function AddMilk(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		milkCount += 2;
		inventory.addMilk(2);
		milkNum.text = " " + inventory.milk;
	}

	public function FillBucket1(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		pailFillingBuffer1--;
	}

	public function FillBucket2(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		pailFillingBuffer2--;
	}

	private function DisplayInstructions(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		add(textBox);
		add(instructions);
		instructions.text = "Hello, welcome to the Dariy! Push the buckets to the cows to milk them. When you're done, you can put the full buckets on the bench and I will bottle it up for you. Fair warning, some of our buckets may have holes, and you may need to come back later to find non-holey bukcets. Enter to exit";
		if (FlxG.keys.justPressed.ENTER)
		{
			textBox.kill();
			instructions.kill();
		}
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
		FlxG.overlap(instructionStart, hero, DisplayInstructions);

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
