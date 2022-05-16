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
import item.Bush;
import item.Ingredient;
import item.Wall;

// Potato Field
class PotatoField extends FlxState
{
	// inventory
	var inventory:Inventory;

	// inventory and return instructions display
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

	// class variables
	var hero:character.Hero;
	var potatoes:FlxTypedGroup<item.Ingredient>;
	var bushes:FlxTypedGroup<item.Bush>;
	var potatoCount:Int = 0;
	var walls:FlxTypedGroup<item.Wall>;
	var randomXLocation:Float = 0;
	var randomYLocation:Float = 0;
	var instructionStart:Wall;
	var textBox:Ingredient;
	var instructions:FlxText;
	var potatoMan:NPC;

	// name to put into load graphics
	var potatoIcon:String = "assets/images/Potato.png";
	var bush1:String = "assets/images/Potato_Bush1.png";
	var bush2:String = "assets/images/Potato_Bush2.png";
	var bush3:String = "assets/images/Potato_Bush3.png";
	var bush4:String = "assets/images/Potato_Bush4.png";

	public function new(incomingInventory:Inventory)
	{
		super();
		inventory = incomingInventory;
	}

	override public function create()
	{
		super.create();

		walls = new FlxTypedGroup<item.Wall>();
		walls.add(new Wall(0, 0, 1400, 100)); // top border
		walls.add(new Wall(0, 0, 100, 1000)); // east border
		walls.add(new Wall(0, 900, 550, 100)); // bottom border
		walls.add(new Wall(1300, 0, 100, 1000)); // west Border
		walls.add(new Wall(850, 900, 600, 100)); // bottom border pt2
		walls.add(new Wall(0, 999, 1400, 1)); // bottom border pt 3
		add(walls);

		instructionStart = new Wall(0, 0, 1400, 1000);
		add(instructionStart);

		add(new FlxSprite(0, 0, "assets/images/Potato_Field.png"));

		potatoes = new FlxTypedGroup<Ingredient>();
		for (i in 0...17)
		{
			randomizeLocation();
			potatoes.add(new Ingredient(randomXLocation, randomYLocation, potatoIcon));
		}
		add(potatoes);

		potatoes.forEach((potato:Ingredient) -> potato.width = 40);
		potatoes.forEach((potato:Ingredient) -> potato.height = 40);
		potatoes.forEach((potato:Ingredient) -> potato.offset.x = 5);
		potatoes.forEach((potato:Ingredient) -> potato.offset.y = 5);

		bushes = new FlxTypedGroup<item.Bush>();
		bushes.add(new Bush(689, 49, bush4));
		bushes.add(new Bush(264, 70, bush4));
		bushes.add(new Bush(326, 118, bush3));
		bushes.add(new Bush(732, 144, bush2));
		bushes.add(new Bush(215, 150, bush1));
		bushes.add(new Bush(884, 240, bush3));
		bushes.add(new Bush(462, 244, bush2));
		bushes.add(new Bush(224, 249, bush4));
		bushes.add(new Bush(509, 335, bush4));
		bushes.add(new Bush(1134, 361, bush3));
		bushes.add(new Bush(1164, 381, bush1));
		bushes.add(new Bush(391, 419, bush3));
		bushes.add(new Bush(327, 429, bush2));
		bushes.add(new Bush(636, 445, bush2));
		bushes.add(new Bush(784, 448, bush2));
		bushes.add(new Bush(442, 448, bush1));
		bushes.add(new Bush(306, 533, bush1));
		bushes.add(new Bush(267, 651, bush4));
		bushes.add(new Bush(828, 695, bush1));
		bushes.add(new Bush(558, 707, bush3));
		bushes.add(new Bush(935, 740, bush4));
		bushes.add(new Bush(84, 595, bush2));
		bushes.add(new Bush(230, 648, bush2));
		add(bushes);

		potatoMan = new NPC(600, 800, "assets/images/PotatoSouth.png");
		add(potatoMan);

		hero = new Hero(650, 850);
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

	public function AddPotato(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		potatoCount++;
		inventory.addPotatoes(1);
		potatoNum.text = " " + inventory.potatoes;
	}

	private function randomizeLocation()
	{
		randomXLocation = FlxG.random.float(200, 1200);
		randomYLocation = FlxG.random.float(200, 800);
	}

	private function DisplayInstructions(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		add(textBox);
		add(instructions);
		instructions.text = "Hello, welcome to the Potato Farm! If you find any potatoes in the bushes, you can use those for your soup! Enter to exit";
		if (FlxG.keys.justPressed.ENTER)
		{
			textBox.kill();
			instructions.kill();
		}
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(potatoes, hero, AddPotato);
		FlxG.collide(hero, walls);
		FlxG.overlap(instructionStart, hero, DisplayInstructions);

		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new MapScene(inventory));
		}

		super.update(elapsed);
	}
}
