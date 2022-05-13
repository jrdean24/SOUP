package;

import character.Hero;
import character.Inventory;
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
class Scene3 extends FlxState
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
		walls.add(new Wall(0, 0, 1400, 1)); // top border
		walls.add(new Wall(0, 0, 1, 1000)); // east border
		walls.add(new Wall(1400, 0, 1400, 1)); // bottom border
		walls.add(new Wall(1400, 1000, 1400, 1)); // Bottom Border
		add(walls);

		add(new FlxSprite(0, 0, "assets/images/Potato_Field.png"));

		potatoes = new FlxTypedGroup<Ingredient>();
		for (i in 0...17)
		{
			randomizeLocation();
			potatoes.add(new Ingredient(randomXLocation, randomYLocation, potatoIcon));
		}
		add(potatoes);

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

		hero = new Hero(50, 50);
		add(hero);

		inventoryDisplayBox = new Wall(1090, 0, 300, 250);
		inventoryDisplayBox.color = FlxColor.fromString("0xAA808080");
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

	public function AddPotato(obj1:flixel.FlxBasic, obj2:flixel.FlxBasic)
	{
		obj1.kill();
		potatoCount++;
		inventory.addPotatoes(1);
		potatoNum.text = "Potatoes: " + inventory.potatoes;
	}

	private function randomizeLocation()
	{
		randomXLocation = FlxG.random.float(200, 1200);
		randomYLocation = FlxG.random.float(200, 800);
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(potatoes, hero, AddPotato);
		FlxG.collide(hero, walls);

		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new MapScene(inventory));
		}

		super.update(elapsed);
	}
}
